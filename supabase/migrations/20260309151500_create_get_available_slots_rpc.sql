-- Migration to create the get_available_slots RPC for the AI Agent (n8n Tool)
CREATE OR REPLACE FUNCTION get_available_slots(p_date DATE)
RETURNS TABLE (available_time TIME)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_user_id UUID;
    v_start_time TIME;
    v_end_time TIME;
    v_lunch_start TIME;
    v_lunch_end TIME;
    v_slot_duration INT;
    v_work_days INT[];
    v_day_of_week INT;
    v_current_time TIME;
    v_now TIMESTAMP WITH TIME ZONE;
BEGIN
    -- Obter a configuração principal do usuário (Wheslan)
    SELECT user_id, start_time, end_time, lunch_start, lunch_end, slot_duration_minutes, work_days
    INTO v_user_id, v_start_time, v_end_time, v_lunch_start, v_lunch_end, v_slot_duration, v_work_days
    FROM schedule_settings
    LIMIT 1;

    -- Se não houver configurações, não retorna nada
    IF v_user_id IS NULL THEN
        RETURN;
    END IF;

    -- Verificar o dia da semana (0=Dom, 1=Seg, ..., 6=Sáb)
    v_day_of_week := EXTRACT(DOW FROM p_date);
    
    -- Se o dia não estiver nos dias de trabalho configurados, retorna vazio
    IF NOT (v_day_of_week = ANY(v_work_days)) THEN
        RETURN;
    END IF;

    -- Horário atual considerando o fuso horário
    v_now := timezone('America/Sao_Paulo', now());

    -- Se a data já passou, retorna vazio
    IF p_date < v_now::date THEN
        RETURN;
    END IF;

    v_current_time := v_start_time;

    -- Gerar os slots de horário
    WHILE v_current_time + (v_slot_duration || ' minutes')::interval <= v_end_time LOOP
        -- Pular se coincidir com horário de almoço
        IF v_lunch_start IS NOT NULL AND v_lunch_end IS NOT NULL THEN
            IF v_current_time >= v_lunch_start AND v_current_time < v_lunch_end THEN
                v_current_time := v_lunch_end;
                CONTINUE;
            END IF;
            -- Se o slot invadir o horário de almoço
            IF v_current_time < v_lunch_start AND v_current_time + (v_slot_duration || ' minutes')::interval > v_lunch_start THEN
                v_current_time := v_lunch_end;
                CONTINUE;
            END IF;
        END IF;

        -- Se a data for hoje, apenas listar horários futuros (+ margem de tempo opcional)
        IF p_date = v_now::date AND v_current_time <= v_now::time THEN
            v_current_time := v_current_time + (v_slot_duration || ' minutes')::interval;
            CONTINUE;
        END IF;

        -- Verificar se o horário já está reservado e confirmado
        IF NOT EXISTS (
            SELECT 1 
            FROM schedules 
            WHERE user_id = v_user_id 
              AND scheduled_date = p_date 
              AND scheduled_time = v_current_time
              AND status = 'confirmed'
        ) THEN
            available_time := v_current_time;
            RETURN NEXT;
        END IF;

        v_current_time := v_current_time + (v_slot_duration || ' minutes')::interval;
    END LOOP;
END;
$$;
