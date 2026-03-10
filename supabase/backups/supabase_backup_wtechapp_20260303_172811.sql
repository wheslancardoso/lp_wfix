--
-- PostgreSQL database dump
--

\restrict j3YbYmPzdj1rQUNYYFnNUk4q0nMrGuBLTsKGCWiUfe7R3vt2wutdOVUycPOQK5S

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.9 (Debian 17.9-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP EVENT TRIGGER IF EXISTS "pgrst_drop_watch";
DROP EVENT TRIGGER IF EXISTS "pgrst_ddl_watch";
DROP EVENT TRIGGER IF EXISTS "issue_pg_net_access";
DROP EVENT TRIGGER IF EXISTS "issue_pg_graphql_access";
DROP EVENT TRIGGER IF EXISTS "issue_pg_cron_access";
DROP EVENT TRIGGER IF EXISTS "issue_graphql_placeholder";
DROP PUBLICATION IF EXISTS "supabase_realtime_messages_publication";
DROP PUBLICATION IF EXISTS "supabase_realtime";
DROP POLICY IF EXISTS "Public can view evidence" ON "storage"."objects";
DROP POLICY IF EXISTS "Public Update" ON "storage"."objects";
DROP POLICY IF EXISTS "Public Select" ON "storage"."objects";
DROP POLICY IF EXISTS "Public Insert" ON "storage"."objects";
DROP POLICY IF EXISTS "Authenticated can upload evidence" ON "storage"."objects";
DROP POLICY IF EXISTS "Authenticated can delete evidence" ON "storage"."objects";
DROP POLICY IF EXISTS "policy_tenants_isolation" ON "public"."tenants";
DROP POLICY IF EXISTS "policy_orders_isolation" ON "public"."orders";
DROP POLICY IF EXISTS "policy_order_logs_select" ON "public"."order_logs";
DROP POLICY IF EXISTS "policy_order_logs_insert" ON "public"."order_logs";
DROP POLICY IF EXISTS "policy_order_items_isolation" ON "public"."order_items";
DROP POLICY IF EXISTS "policy_equipments_isolation" ON "public"."equipments";
DROP POLICY IF EXISTS "policy_customers_isolation" ON "public"."customers";
DROP POLICY IF EXISTS "Users can view telemetry from their tenant" ON "public"."hardware_telemetry";
DROP POLICY IF EXISTS "Users can view own presets" ON "public"."task_presets";
DROP POLICY IF EXISTS "Users can view and manage their own service catalog" ON "public"."service_catalog";
DROP POLICY IF EXISTS "Users can insert telemetry for their tenant" ON "public"."hardware_telemetry";
DROP POLICY IF EXISTS "Users can delete own presets" ON "public"."task_presets";
DROP POLICY IF EXISTS "Users can create own presets" ON "public"."task_presets";
DROP POLICY IF EXISTS "Técnicos podem ver suas configurações" ON "public"."schedule_settings";
DROP POLICY IF EXISTS "Técnicos podem ver seus agendamentos" ON "public"."schedules";
DROP POLICY IF EXISTS "Técnicos podem inserir suas configurações" ON "public"."schedule_settings";
DROP POLICY IF EXISTS "Técnicos podem inserir agendamentos" ON "public"."schedules";
DROP POLICY IF EXISTS "Técnicos podem excluir seus agendamentos" ON "public"."schedules";
DROP POLICY IF EXISTS "Técnicos podem atualizar suas configurações" ON "public"."schedule_settings";
DROP POLICY IF EXISTS "Técnicos podem atualizar seus agendamentos" ON "public"."schedules";
DROP POLICY IF EXISTS "Public can insert leads" ON "public"."leads";
DROP POLICY IF EXISTS "Permitir leitura para admin" ON "public"."leads";
DROP POLICY IF EXISTS "Permitir inserção pública" ON "public"."leads";
DROP POLICY IF EXISTS "Enable read for service role only" ON "public"."nps_feedbacks";
DROP POLICY IF EXISTS "Enable read access for all users" ON "public"."technical_reports";
DROP POLICY IF EXISTS "Enable insert/update for authenticated users" ON "public"."technical_reports";
DROP POLICY IF EXISTS "Enable insert for everyone" ON "public"."nps_feedbacks";
DROP POLICY IF EXISTS "Enable all for authenticated users" ON "public"."follow_ups";
DROP POLICY IF EXISTS "Clientes podem ver agendamento pelo token" ON "public"."schedules";
DROP POLICY IF EXISTS "Admins can view leads" ON "public"."leads";
DROP POLICY IF EXISTS "Admins can update leads" ON "public"."leads";
ALTER TABLE IF EXISTS ONLY "storage"."vector_indexes" DROP CONSTRAINT IF EXISTS "vector_indexes_bucket_id_fkey";
ALTER TABLE IF EXISTS ONLY "storage"."s3_multipart_uploads_parts" DROP CONSTRAINT IF EXISTS "s3_multipart_uploads_parts_upload_id_fkey";
ALTER TABLE IF EXISTS ONLY "storage"."s3_multipart_uploads_parts" DROP CONSTRAINT IF EXISTS "s3_multipart_uploads_parts_bucket_id_fkey";
ALTER TABLE IF EXISTS ONLY "storage"."s3_multipart_uploads" DROP CONSTRAINT IF EXISTS "s3_multipart_uploads_bucket_id_fkey";
ALTER TABLE IF EXISTS ONLY "storage"."objects" DROP CONSTRAINT IF EXISTS "objects_bucketId_fkey";
ALTER TABLE IF EXISTS ONLY "public"."tenants" DROP CONSTRAINT IF EXISTS "tenants_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."tenant_settings" DROP CONSTRAINT IF EXISTS "tenant_settings_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."technical_reports" DROP CONSTRAINT IF EXISTS "technical_reports_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."task_presets" DROP CONSTRAINT IF EXISTS "task_presets_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."service_catalog" DROP CONSTRAINT IF EXISTS "service_catalog_tenant_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."schedules" DROP CONSTRAINT IF EXISTS "schedules_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."schedules" DROP CONSTRAINT IF EXISTS "schedules_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."schedules" DROP CONSTRAINT IF EXISTS "schedules_customer_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."schedule_settings" DROP CONSTRAINT IF EXISTS "schedule_settings_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."orders" DROP CONSTRAINT IF EXISTS "orders_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."orders" DROP CONSTRAINT IF EXISTS "orders_equipment_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."orders" DROP CONSTRAINT IF EXISTS "orders_customer_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."order_logs" DROP CONSTRAINT IF EXISTS "order_logs_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."order_logs" DROP CONSTRAINT IF EXISTS "order_logs_changed_by_fkey";
ALTER TABLE IF EXISTS ONLY "public"."order_items" DROP CONSTRAINT IF EXISTS "order_items_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."nps_feedbacks" DROP CONSTRAINT IF EXISTS "nps_feedbacks_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."nps_feedbacks" DROP CONSTRAINT IF EXISTS "nps_feedbacks_customer_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."leads" DROP CONSTRAINT IF EXISTS "leads_tenant_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."hardware_telemetry" DROP CONSTRAINT IF EXISTS "hardware_telemetry_tenant_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."hardware_telemetry" DROP CONSTRAINT IF EXISTS "hardware_telemetry_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."hardware_telemetry" DROP CONSTRAINT IF EXISTS "hardware_telemetry_equipment_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."follow_ups" DROP CONSTRAINT IF EXISTS "follow_ups_order_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."follow_ups" DROP CONSTRAINT IF EXISTS "follow_ups_customer_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."equipments" DROP CONSTRAINT IF EXISTS "equipments_customer_id_fkey";
ALTER TABLE IF EXISTS ONLY "public"."customers" DROP CONSTRAINT IF EXISTS "customers_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."sso_domains" DROP CONSTRAINT IF EXISTS "sso_domains_sso_provider_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."sessions" DROP CONSTRAINT IF EXISTS "sessions_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."sessions" DROP CONSTRAINT IF EXISTS "sessions_oauth_client_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_relay_states" DROP CONSTRAINT IF EXISTS "saml_relay_states_sso_provider_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_relay_states" DROP CONSTRAINT IF EXISTS "saml_relay_states_flow_state_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_providers" DROP CONSTRAINT IF EXISTS "saml_providers_sso_provider_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."refresh_tokens" DROP CONSTRAINT IF EXISTS "refresh_tokens_session_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."one_time_tokens" DROP CONSTRAINT IF EXISTS "one_time_tokens_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_consents" DROP CONSTRAINT IF EXISTS "oauth_consents_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_consents" DROP CONSTRAINT IF EXISTS "oauth_consents_client_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_authorizations" DROP CONSTRAINT IF EXISTS "oauth_authorizations_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_authorizations" DROP CONSTRAINT IF EXISTS "oauth_authorizations_client_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_factors" DROP CONSTRAINT IF EXISTS "mfa_factors_user_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_challenges" DROP CONSTRAINT IF EXISTS "mfa_challenges_auth_factor_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_amr_claims" DROP CONSTRAINT IF EXISTS "mfa_amr_claims_session_id_fkey";
ALTER TABLE IF EXISTS ONLY "auth"."identities" DROP CONSTRAINT IF EXISTS "identities_user_id_fkey";
DROP TRIGGER IF EXISTS "update_objects_updated_at" ON "storage"."objects";
DROP TRIGGER IF EXISTS "protect_objects_delete" ON "storage"."objects";
DROP TRIGGER IF EXISTS "protect_buckets_delete" ON "storage"."buckets";
DROP TRIGGER IF EXISTS "enforce_bucket_name_length_trigger" ON "storage"."buckets";
DROP TRIGGER IF EXISTS "tr_check_filters" ON "realtime"."subscription";
DROP TRIGGER IF EXISTS "update_schedules_updated_at" ON "public"."schedules";
DROP TRIGGER IF EXISTS "update_schedule_settings_updated_at" ON "public"."schedule_settings";
DROP TRIGGER IF EXISTS "trigger_orders_updated_at" ON "public"."orders";
DROP TRIGGER IF EXISTS "trigger_leads_updated_at" ON "public"."leads";
DROP TRIGGER IF EXISTS "trigger_generate_smart_id" ON "public"."orders";
DROP TRIGGER IF EXISTS "trigger_equipments_updated_at" ON "public"."equipments";
DROP TRIGGER IF EXISTS "trigger_customers_updated_at" ON "public"."customers";
DROP TRIGGER IF EXISTS "trg_order_status_change" ON "public"."orders";
DROP TRIGGER IF EXISTS "on_schedule_event" ON "public"."schedules";
DROP TRIGGER IF EXISTS "enviar_lembrete_n8n" ON "public"."schedules";
DROP INDEX IF EXISTS "supabase_functions"."supabase_functions_hooks_request_id_idx";
DROP INDEX IF EXISTS "supabase_functions"."supabase_functions_hooks_h_table_id_h_name_idx";
DROP INDEX IF EXISTS "storage"."vector_indexes_name_bucket_id_idx";
DROP INDEX IF EXISTS "storage"."name_prefix_search";
DROP INDEX IF EXISTS "storage"."idx_objects_bucket_id_name_lower";
DROP INDEX IF EXISTS "storage"."idx_objects_bucket_id_name";
DROP INDEX IF EXISTS "storage"."idx_multipart_uploads_list";
DROP INDEX IF EXISTS "storage"."buckets_analytics_unique_name_idx";
DROP INDEX IF EXISTS "storage"."bucketid_objname";
DROP INDEX IF EXISTS "storage"."bname";
DROP INDEX IF EXISTS "realtime"."subscription_subscription_id_entity_filters_action_filter_key";
DROP INDEX IF EXISTS "realtime"."messages_inserted_at_topic_index";
DROP INDEX IF EXISTS "realtime"."ix_realtime_subscription_entity";
DROP INDEX IF EXISTS "public"."idx_tenant_settings_user";
DROP INDEX IF EXISTS "public"."idx_telemetry_tenant";
DROP INDEX IF EXISTS "public"."idx_telemetry_order";
DROP INDEX IF EXISTS "public"."idx_telemetry_equipment";
DROP INDEX IF EXISTS "public"."idx_schedules_user_id";
DROP INDEX IF EXISTS "public"."idx_schedules_token";
DROP INDEX IF EXISTS "public"."idx_schedules_status";
DROP INDEX IF EXISTS "public"."idx_schedules_scheduled_date";
DROP INDEX IF EXISTS "public"."idx_orders_warranty_end";
DROP INDEX IF EXISTS "public"."idx_orders_user_id";
DROP INDEX IF EXISTS "public"."idx_orders_status";
DROP INDEX IF EXISTS "public"."idx_orders_integrity_hash";
DROP INDEX IF EXISTS "public"."idx_orders_execution_tasks";
DROP INDEX IF EXISTS "public"."idx_orders_equipment_id";
DROP INDEX IF EXISTS "public"."idx_orders_display_id_unique";
DROP INDEX IF EXISTS "public"."idx_orders_customer_id";
DROP INDEX IF EXISTS "public"."idx_orders_created_at";
DROP INDEX IF EXISTS "public"."idx_order_logs_order_id";
DROP INDEX IF EXISTS "public"."idx_order_logs_created_at";
DROP INDEX IF EXISTS "public"."idx_order_items_order_id";
DROP INDEX IF EXISTS "public"."idx_nps_feedbacks_google_clicks";
DROP INDEX IF EXISTS "public"."idx_leads_tenant_id";
DROP INDEX IF EXISTS "public"."idx_leads_status";
DROP INDEX IF EXISTS "public"."idx_leads_created_at";
DROP INDEX IF EXISTS "public"."idx_follow_ups_status";
DROP INDEX IF EXISTS "public"."idx_follow_ups_scheduled";
DROP INDEX IF EXISTS "public"."idx_follow_ups_order";
DROP INDEX IF EXISTS "public"."idx_equipments_customer_id";
DROP INDEX IF EXISTS "public"."idx_customers_user_id";
DROP INDEX IF EXISTS "auth"."users_is_anonymous_idx";
DROP INDEX IF EXISTS "auth"."users_instance_id_idx";
DROP INDEX IF EXISTS "auth"."users_instance_id_email_idx";
DROP INDEX IF EXISTS "auth"."users_email_partial_key";
DROP INDEX IF EXISTS "auth"."user_id_created_at_idx";
DROP INDEX IF EXISTS "auth"."unique_phone_factor_per_user";
DROP INDEX IF EXISTS "auth"."sso_providers_resource_id_pattern_idx";
DROP INDEX IF EXISTS "auth"."sso_providers_resource_id_idx";
DROP INDEX IF EXISTS "auth"."sso_domains_sso_provider_id_idx";
DROP INDEX IF EXISTS "auth"."sso_domains_domain_idx";
DROP INDEX IF EXISTS "auth"."sessions_user_id_idx";
DROP INDEX IF EXISTS "auth"."sessions_oauth_client_id_idx";
DROP INDEX IF EXISTS "auth"."sessions_not_after_idx";
DROP INDEX IF EXISTS "auth"."saml_relay_states_sso_provider_id_idx";
DROP INDEX IF EXISTS "auth"."saml_relay_states_for_email_idx";
DROP INDEX IF EXISTS "auth"."saml_relay_states_created_at_idx";
DROP INDEX IF EXISTS "auth"."saml_providers_sso_provider_id_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_updated_at_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_session_id_revoked_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_parent_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_instance_id_user_id_idx";
DROP INDEX IF EXISTS "auth"."refresh_tokens_instance_id_idx";
DROP INDEX IF EXISTS "auth"."recovery_token_idx";
DROP INDEX IF EXISTS "auth"."reauthentication_token_idx";
DROP INDEX IF EXISTS "auth"."one_time_tokens_user_id_token_type_key";
DROP INDEX IF EXISTS "auth"."one_time_tokens_token_hash_hash_idx";
DROP INDEX IF EXISTS "auth"."one_time_tokens_relates_to_hash_idx";
DROP INDEX IF EXISTS "auth"."oauth_consents_user_order_idx";
DROP INDEX IF EXISTS "auth"."oauth_consents_active_user_client_idx";
DROP INDEX IF EXISTS "auth"."oauth_consents_active_client_idx";
DROP INDEX IF EXISTS "auth"."oauth_clients_deleted_at_idx";
DROP INDEX IF EXISTS "auth"."oauth_auth_pending_exp_idx";
DROP INDEX IF EXISTS "auth"."mfa_factors_user_id_idx";
DROP INDEX IF EXISTS "auth"."mfa_factors_user_friendly_name_unique";
DROP INDEX IF EXISTS "auth"."mfa_challenge_created_at_idx";
DROP INDEX IF EXISTS "auth"."idx_user_id_auth_method";
DROP INDEX IF EXISTS "auth"."idx_oauth_client_states_created_at";
DROP INDEX IF EXISTS "auth"."idx_auth_code";
DROP INDEX IF EXISTS "auth"."identities_user_id_idx";
DROP INDEX IF EXISTS "auth"."identities_email_idx";
DROP INDEX IF EXISTS "auth"."flow_state_created_at_idx";
DROP INDEX IF EXISTS "auth"."factor_id_created_at_idx";
DROP INDEX IF EXISTS "auth"."email_change_token_new_idx";
DROP INDEX IF EXISTS "auth"."email_change_token_current_idx";
DROP INDEX IF EXISTS "auth"."confirmation_token_idx";
DROP INDEX IF EXISTS "auth"."audit_logs_instance_id_idx";
ALTER TABLE IF EXISTS ONLY "supabase_migrations"."schema_migrations" DROP CONSTRAINT IF EXISTS "schema_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "supabase_functions"."migrations" DROP CONSTRAINT IF EXISTS "migrations_pkey";
ALTER TABLE IF EXISTS ONLY "supabase_functions"."hooks" DROP CONSTRAINT IF EXISTS "hooks_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."vector_indexes" DROP CONSTRAINT IF EXISTS "vector_indexes_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."s3_multipart_uploads" DROP CONSTRAINT IF EXISTS "s3_multipart_uploads_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."s3_multipart_uploads_parts" DROP CONSTRAINT IF EXISTS "s3_multipart_uploads_parts_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."objects" DROP CONSTRAINT IF EXISTS "objects_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."migrations" DROP CONSTRAINT IF EXISTS "migrations_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."migrations" DROP CONSTRAINT IF EXISTS "migrations_name_key";
ALTER TABLE IF EXISTS ONLY "storage"."buckets_vectors" DROP CONSTRAINT IF EXISTS "buckets_vectors_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."buckets" DROP CONSTRAINT IF EXISTS "buckets_pkey";
ALTER TABLE IF EXISTS ONLY "storage"."buckets_analytics" DROP CONSTRAINT IF EXISTS "buckets_analytics_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."schema_migrations" DROP CONSTRAINT IF EXISTS "schema_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."subscription" DROP CONSTRAINT IF EXISTS "pk_subscription";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_03_06" DROP CONSTRAINT IF EXISTS "messages_2026_03_06_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_03_05" DROP CONSTRAINT IF EXISTS "messages_2026_03_05_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_03_04" DROP CONSTRAINT IF EXISTS "messages_2026_03_04_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_03_03" DROP CONSTRAINT IF EXISTS "messages_2026_03_03_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_03_02" DROP CONSTRAINT IF EXISTS "messages_2026_03_02_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_03_01" DROP CONSTRAINT IF EXISTS "messages_2026_03_01_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages_2026_02_28" DROP CONSTRAINT IF EXISTS "messages_2026_02_28_pkey";
ALTER TABLE IF EXISTS ONLY "realtime"."messages" DROP CONSTRAINT IF EXISTS "messages_pkey";
ALTER TABLE IF EXISTS ONLY "public"."tenants" DROP CONSTRAINT IF EXISTS "tenants_pkey";
ALTER TABLE IF EXISTS ONLY "public"."tenants" DROP CONSTRAINT IF EXISTS "tenants_os_prefix_key";
ALTER TABLE IF EXISTS ONLY "public"."tenant_settings" DROP CONSTRAINT IF EXISTS "tenant_settings_user_id_key";
ALTER TABLE IF EXISTS ONLY "public"."tenant_settings" DROP CONSTRAINT IF EXISTS "tenant_settings_pkey";
ALTER TABLE IF EXISTS ONLY "public"."technical_reports" DROP CONSTRAINT IF EXISTS "technical_reports_pkey";
ALTER TABLE IF EXISTS ONLY "public"."technical_reports" DROP CONSTRAINT IF EXISTS "technical_reports_order_id_key";
ALTER TABLE IF EXISTS ONLY "public"."task_presets" DROP CONSTRAINT IF EXISTS "task_presets_pkey";
ALTER TABLE IF EXISTS ONLY "public"."service_catalog" DROP CONSTRAINT IF EXISTS "service_catalog_pkey";
ALTER TABLE IF EXISTS ONLY "public"."schedules" DROP CONSTRAINT IF EXISTS "schedules_token_key";
ALTER TABLE IF EXISTS ONLY "public"."schedules" DROP CONSTRAINT IF EXISTS "schedules_pkey";
ALTER TABLE IF EXISTS ONLY "public"."schedule_settings" DROP CONSTRAINT IF EXISTS "schedule_settings_user_id_key";
ALTER TABLE IF EXISTS ONLY "public"."schedule_settings" DROP CONSTRAINT IF EXISTS "schedule_settings_pkey";
ALTER TABLE IF EXISTS ONLY "public"."orders" DROP CONSTRAINT IF EXISTS "orders_pkey";
ALTER TABLE IF EXISTS ONLY "public"."order_logs" DROP CONSTRAINT IF EXISTS "order_logs_pkey";
ALTER TABLE IF EXISTS ONLY "public"."order_items" DROP CONSTRAINT IF EXISTS "order_items_pkey";
ALTER TABLE IF EXISTS ONLY "public"."nps_feedbacks" DROP CONSTRAINT IF EXISTS "nps_feedbacks_pkey";
ALTER TABLE IF EXISTS ONLY "public"."nps_feedbacks" DROP CONSTRAINT IF EXISTS "nps_feedbacks_order_id_key";
ALTER TABLE IF EXISTS ONLY "public"."nps_feedbacks" DROP CONSTRAINT IF EXISTS "nps_feedbacks_discount_code_key";
ALTER TABLE IF EXISTS ONLY "public"."leads" DROP CONSTRAINT IF EXISTS "leads_pkey";
ALTER TABLE IF EXISTS ONLY "public"."hardware_telemetry" DROP CONSTRAINT IF EXISTS "hardware_telemetry_pkey";
ALTER TABLE IF EXISTS ONLY "public"."follow_ups" DROP CONSTRAINT IF EXISTS "follow_ups_pkey";
ALTER TABLE IF EXISTS ONLY "public"."equipments" DROP CONSTRAINT IF EXISTS "equipments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customers" DROP CONSTRAINT IF EXISTS "customers_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."users" DROP CONSTRAINT IF EXISTS "users_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."users" DROP CONSTRAINT IF EXISTS "users_phone_key";
ALTER TABLE IF EXISTS ONLY "auth"."sso_providers" DROP CONSTRAINT IF EXISTS "sso_providers_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."sso_domains" DROP CONSTRAINT IF EXISTS "sso_domains_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."sessions" DROP CONSTRAINT IF EXISTS "sessions_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."schema_migrations" DROP CONSTRAINT IF EXISTS "schema_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_relay_states" DROP CONSTRAINT IF EXISTS "saml_relay_states_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_providers" DROP CONSTRAINT IF EXISTS "saml_providers_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."saml_providers" DROP CONSTRAINT IF EXISTS "saml_providers_entity_id_key";
ALTER TABLE IF EXISTS ONLY "auth"."refresh_tokens" DROP CONSTRAINT IF EXISTS "refresh_tokens_token_unique";
ALTER TABLE IF EXISTS ONLY "auth"."refresh_tokens" DROP CONSTRAINT IF EXISTS "refresh_tokens_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."one_time_tokens" DROP CONSTRAINT IF EXISTS "one_time_tokens_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_consents" DROP CONSTRAINT IF EXISTS "oauth_consents_user_client_unique";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_consents" DROP CONSTRAINT IF EXISTS "oauth_consents_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_clients" DROP CONSTRAINT IF EXISTS "oauth_clients_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_client_states" DROP CONSTRAINT IF EXISTS "oauth_client_states_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_authorizations" DROP CONSTRAINT IF EXISTS "oauth_authorizations_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_authorizations" DROP CONSTRAINT IF EXISTS "oauth_authorizations_authorization_id_key";
ALTER TABLE IF EXISTS ONLY "auth"."oauth_authorizations" DROP CONSTRAINT IF EXISTS "oauth_authorizations_authorization_code_key";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_factors" DROP CONSTRAINT IF EXISTS "mfa_factors_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_factors" DROP CONSTRAINT IF EXISTS "mfa_factors_last_challenged_at_key";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_challenges" DROP CONSTRAINT IF EXISTS "mfa_challenges_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_amr_claims" DROP CONSTRAINT IF EXISTS "mfa_amr_claims_session_id_authentication_method_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."instances" DROP CONSTRAINT IF EXISTS "instances_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."identities" DROP CONSTRAINT IF EXISTS "identities_provider_id_provider_unique";
ALTER TABLE IF EXISTS ONLY "auth"."identities" DROP CONSTRAINT IF EXISTS "identities_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."flow_state" DROP CONSTRAINT IF EXISTS "flow_state_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."audit_log_entries" DROP CONSTRAINT IF EXISTS "audit_log_entries_pkey";
ALTER TABLE IF EXISTS ONLY "auth"."mfa_amr_claims" DROP CONSTRAINT IF EXISTS "amr_id_pk";
ALTER TABLE IF EXISTS "supabase_functions"."hooks" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "auth"."refresh_tokens" ALTER COLUMN "id" DROP DEFAULT;
DROP TABLE IF EXISTS "supabase_migrations"."schema_migrations";
DROP TABLE IF EXISTS "supabase_functions"."migrations";
DROP SEQUENCE IF EXISTS "supabase_functions"."hooks_id_seq";
DROP TABLE IF EXISTS "supabase_functions"."hooks";
DROP TABLE IF EXISTS "storage"."vector_indexes";
DROP TABLE IF EXISTS "storage"."s3_multipart_uploads_parts";
DROP TABLE IF EXISTS "storage"."s3_multipart_uploads";
DROP TABLE IF EXISTS "storage"."objects";
DROP TABLE IF EXISTS "storage"."migrations";
DROP TABLE IF EXISTS "storage"."buckets_vectors";
DROP TABLE IF EXISTS "storage"."buckets_analytics";
DROP TABLE IF EXISTS "storage"."buckets";
DROP TABLE IF EXISTS "realtime"."subscription";
DROP TABLE IF EXISTS "realtime"."schema_migrations";
DROP TABLE IF EXISTS "realtime"."messages_2026_03_06";
DROP TABLE IF EXISTS "realtime"."messages_2026_03_05";
DROP TABLE IF EXISTS "realtime"."messages_2026_03_04";
DROP TABLE IF EXISTS "realtime"."messages_2026_03_03";
DROP TABLE IF EXISTS "realtime"."messages_2026_03_02";
DROP TABLE IF EXISTS "realtime"."messages_2026_03_01";
DROP TABLE IF EXISTS "realtime"."messages_2026_02_28";
DROP TABLE IF EXISTS "realtime"."messages";
DROP VIEW IF EXISTS "public"."v_tenant_settings";
DROP VIEW IF EXISTS "public"."v_public_store_info";
DROP VIEW IF EXISTS "public"."v_order_timeline";
DROP VIEW IF EXISTS "public"."v_monthly_metrics";
DROP VIEW IF EXISTS "public"."v_current_month_metrics";
DROP TABLE IF EXISTS "public"."tenants";
DROP TABLE IF EXISTS "public"."tenant_settings";
DROP TABLE IF EXISTS "public"."technical_reports";
DROP TABLE IF EXISTS "public"."task_presets";
DROP TABLE IF EXISTS "public"."service_catalog";
DROP TABLE IF EXISTS "public"."schedules";
DROP TABLE IF EXISTS "public"."schedule_settings";
DROP SEQUENCE IF EXISTS "public"."orders_display_id_seq";
DROP TABLE IF EXISTS "public"."orders";
DROP TABLE IF EXISTS "public"."order_logs";
DROP TABLE IF EXISTS "public"."order_items";
DROP TABLE IF EXISTS "public"."nps_feedbacks";
DROP TABLE IF EXISTS "public"."leads";
DROP TABLE IF EXISTS "public"."hardware_telemetry";
DROP TABLE IF EXISTS "public"."follow_ups";
DROP TABLE IF EXISTS "public"."equipments";
DROP TABLE IF EXISTS "public"."customers";
DROP TABLE IF EXISTS "auth"."users";
DROP TABLE IF EXISTS "auth"."sso_providers";
DROP TABLE IF EXISTS "auth"."sso_domains";
DROP TABLE IF EXISTS "auth"."sessions";
DROP TABLE IF EXISTS "auth"."schema_migrations";
DROP TABLE IF EXISTS "auth"."saml_relay_states";
DROP TABLE IF EXISTS "auth"."saml_providers";
DROP SEQUENCE IF EXISTS "auth"."refresh_tokens_id_seq";
DROP TABLE IF EXISTS "auth"."refresh_tokens";
DROP TABLE IF EXISTS "auth"."one_time_tokens";
DROP TABLE IF EXISTS "auth"."oauth_consents";
DROP TABLE IF EXISTS "auth"."oauth_clients";
DROP TABLE IF EXISTS "auth"."oauth_client_states";
DROP TABLE IF EXISTS "auth"."oauth_authorizations";
DROP TABLE IF EXISTS "auth"."mfa_factors";
DROP TABLE IF EXISTS "auth"."mfa_challenges";
DROP TABLE IF EXISTS "auth"."mfa_amr_claims";
DROP TABLE IF EXISTS "auth"."instances";
DROP TABLE IF EXISTS "auth"."identities";
DROP TABLE IF EXISTS "auth"."flow_state";
DROP TABLE IF EXISTS "auth"."audit_log_entries";
DROP FUNCTION IF EXISTS "supabase_functions"."http_request"();
DROP FUNCTION IF EXISTS "storage"."update_updated_at_column"();
DROP FUNCTION IF EXISTS "storage"."search_v2"("prefix" "text", "bucket_name" "text", "limits" integer, "levels" integer, "start_after" "text", "sort_order" "text", "sort_column" "text", "sort_column_after" "text");
DROP FUNCTION IF EXISTS "storage"."search_legacy_v1"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text");
DROP FUNCTION IF EXISTS "storage"."search_by_timestamp"("p_prefix" "text", "p_bucket_id" "text", "p_limit" integer, "p_level" integer, "p_start_after" "text", "p_sort_order" "text", "p_sort_column" "text", "p_sort_column_after" "text");
DROP FUNCTION IF EXISTS "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer, "levels" integer, "offsets" integer, "search" "text", "sortcolumn" "text", "sortorder" "text");
DROP FUNCTION IF EXISTS "storage"."protect_delete"();
DROP FUNCTION IF EXISTS "storage"."operation"();
DROP FUNCTION IF EXISTS "storage"."list_objects_with_delimiter"("_bucket_id" "text", "prefix_param" "text", "delimiter_param" "text", "max_keys" integer, "start_after" "text", "next_token" "text", "sort_order" "text");
DROP FUNCTION IF EXISTS "storage"."list_multipart_uploads_with_delimiter"("bucket_id" "text", "prefix_param" "text", "delimiter_param" "text", "max_keys" integer, "next_key_token" "text", "next_upload_token" "text");
DROP FUNCTION IF EXISTS "storage"."get_size_by_bucket"();
DROP FUNCTION IF EXISTS "storage"."get_prefixes"("name" "text");
DROP FUNCTION IF EXISTS "storage"."get_prefix"("name" "text");
DROP FUNCTION IF EXISTS "storage"."get_level"("name" "text");
DROP FUNCTION IF EXISTS "storage"."get_common_prefix"("p_key" "text", "p_prefix" "text", "p_delimiter" "text");
DROP FUNCTION IF EXISTS "storage"."foldername"("name" "text");
DROP FUNCTION IF EXISTS "storage"."filename"("name" "text");
DROP FUNCTION IF EXISTS "storage"."extension"("name" "text");
DROP FUNCTION IF EXISTS "storage"."enforce_bucket_name_length"();
DROP FUNCTION IF EXISTS "storage"."delete_leaf_prefixes"("bucket_ids" "text"[], "names" "text"[]);
DROP FUNCTION IF EXISTS "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb");
DROP FUNCTION IF EXISTS "realtime"."topic"();
DROP FUNCTION IF EXISTS "realtime"."to_regrole"("role_name" "text");
DROP FUNCTION IF EXISTS "realtime"."subscription_check_filters"();
DROP FUNCTION IF EXISTS "realtime"."send"("payload" "jsonb", "event" "text", "topic" "text", "private" boolean);
DROP FUNCTION IF EXISTS "realtime"."quote_wal2json"("entity" "regclass");
DROP FUNCTION IF EXISTS "realtime"."list_changes"("publication" "name", "slot_name" "name", "max_changes" integer, "max_record_bytes" integer);
DROP FUNCTION IF EXISTS "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]);
DROP FUNCTION IF EXISTS "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text");
DROP FUNCTION IF EXISTS "realtime"."cast"("val" "text", "type_" "regtype");
DROP FUNCTION IF EXISTS "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]);
DROP FUNCTION IF EXISTS "realtime"."broadcast_changes"("topic_name" "text", "event_name" "text", "operation" "text", "table_name" "text", "table_schema" "text", "new" "record", "old" "record", "level" "text");
DROP FUNCTION IF EXISTS "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer);
DROP FUNCTION IF EXISTS "public"."update_updated_at_column"();
DROP FUNCTION IF EXISTS "public"."update_updated_at"();
DROP FUNCTION IF EXISTS "public"."update_active_leads_updated_at"();
DROP FUNCTION IF EXISTS "public"."notify_n8n_on_schedule_change"();
DROP FUNCTION IF EXISTS "public"."notify_n8n_new_schedule"();
DROP FUNCTION IF EXISTS "public"."generate_smart_id"();
DROP FUNCTION IF EXISTS "public"."fn_log_order_status_change"();
DROP FUNCTION IF EXISTS "public"."fn_create_default_settings"();
DROP FUNCTION IF EXISTS "pgbouncer"."get_auth"("p_usename" "text");
DROP FUNCTION IF EXISTS "extensions"."set_graphql_placeholder"();
DROP FUNCTION IF EXISTS "extensions"."pgrst_drop_watch"();
DROP FUNCTION IF EXISTS "extensions"."pgrst_ddl_watch"();
DROP FUNCTION IF EXISTS "extensions"."grant_pg_net_access"();
DROP FUNCTION IF EXISTS "extensions"."grant_pg_graphql_access"();
DROP FUNCTION IF EXISTS "extensions"."grant_pg_cron_access"();
DROP FUNCTION IF EXISTS "auth"."uid"();
DROP FUNCTION IF EXISTS "auth"."role"();
DROP FUNCTION IF EXISTS "auth"."jwt"();
DROP FUNCTION IF EXISTS "auth"."email"();
DROP TYPE IF EXISTS "storage"."buckettype";
DROP TYPE IF EXISTS "realtime"."wal_rls";
DROP TYPE IF EXISTS "realtime"."wal_column";
DROP TYPE IF EXISTS "realtime"."user_defined_filter";
DROP TYPE IF EXISTS "realtime"."equality_op";
DROP TYPE IF EXISTS "realtime"."action";
DROP TYPE IF EXISTS "public"."schedule_status";
DROP TYPE IF EXISTS "public"."order_status";
DROP TYPE IF EXISTS "public"."order_item_type";
DROP TYPE IF EXISTS "auth"."one_time_token_type";
DROP TYPE IF EXISTS "auth"."oauth_response_type";
DROP TYPE IF EXISTS "auth"."oauth_registration_type";
DROP TYPE IF EXISTS "auth"."oauth_client_type";
DROP TYPE IF EXISTS "auth"."oauth_authorization_status";
DROP TYPE IF EXISTS "auth"."factor_type";
DROP TYPE IF EXISTS "auth"."factor_status";
DROP TYPE IF EXISTS "auth"."code_challenge_method";
DROP TYPE IF EXISTS "auth"."aal_level";
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS "supabase_vault";
DROP EXTENSION IF EXISTS "pgcrypto";
DROP EXTENSION IF EXISTS "pg_stat_statements";
DROP EXTENSION IF EXISTS "pg_graphql";
DROP SCHEMA IF EXISTS "vault";
DROP SCHEMA IF EXISTS "supabase_migrations";
DROP SCHEMA IF EXISTS "supabase_functions";
DROP SCHEMA IF EXISTS "storage";
DROP SCHEMA IF EXISTS "realtime";
DROP SCHEMA IF EXISTS "pgbouncer";
DROP EXTENSION IF EXISTS "pg_net";
DROP SCHEMA IF EXISTS "graphql_public";
DROP SCHEMA IF EXISTS "graphql";
DROP SCHEMA IF EXISTS "extensions";
DROP EXTENSION IF EXISTS "pg_cron";
DROP SCHEMA IF EXISTS "auth";
--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "auth";


--
-- Name: pg_cron; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA "pg_catalog";


--
-- Name: EXTENSION "pg_cron"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pg_cron" IS 'Job scheduler for PostgreSQL';


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "extensions";


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "graphql";


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "graphql_public";


--
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "public";


--
-- Name: EXTENSION "pg_net"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pg_net" IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "pgbouncer";


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "realtime";


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "storage";


--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "supabase_functions";


--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "supabase_migrations";


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA "vault";


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";


--
-- Name: EXTENSION "pg_graphql"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pg_graphql" IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "pg_stat_statements"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pg_stat_statements" IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "pgcrypto"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pgcrypto" IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";


--
-- Name: EXTENSION "supabase_vault"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "supabase_vault" IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."aal_level" AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."code_challenge_method" AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."factor_status" AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."factor_type" AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."oauth_authorization_status" AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."oauth_client_type" AS ENUM (
    'public',
    'confidential'
);


--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."oauth_registration_type" AS ENUM (
    'dynamic',
    'manual'
);


--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."oauth_response_type" AS ENUM (
    'code'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE "auth"."one_time_token_type" AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: order_item_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."order_item_type" AS ENUM (
    'service',
    'part_external'
);


--
-- Name: order_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."order_status" AS ENUM (
    'open',
    'analyzing',
    'waiting_approval',
    'waiting_parts',
    'in_progress',
    'ready',
    'finished',
    'canceled'
);


--
-- Name: schedule_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."schedule_status" AS ENUM (
    'pending',
    'confirmed',
    'canceled',
    'expired'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE "realtime"."action" AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE "realtime"."equality_op" AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE "realtime"."user_defined_filter" AS (
	"column_name" "text",
	"op" "realtime"."equality_op",
	"value" "text"
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE "realtime"."wal_column" AS (
	"name" "text",
	"type_name" "text",
	"type_oid" "oid",
	"value" "jsonb",
	"is_pkey" boolean,
	"is_selectable" boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE "realtime"."wal_rls" AS (
	"wal" "jsonb",
	"is_rls_enabled" boolean,
	"subscription_ids" "uuid"[],
	"errors" "text"[]
);


--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE "storage"."buckettype" AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION "auth"."email"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- Name: FUNCTION "email"(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION "auth"."email"() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION "auth"."jwt"() RETURNS "jsonb"
    LANGUAGE "sql" STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION "auth"."role"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- Name: FUNCTION "role"(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION "auth"."role"() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION "auth"."uid"() RETURNS "uuid"
    LANGUAGE "sql" STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- Name: FUNCTION "uid"(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION "auth"."uid"() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION "extensions"."grant_pg_cron_access"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


--
-- Name: FUNCTION "grant_pg_cron_access"(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION "extensions"."grant_pg_cron_access"() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION "extensions"."grant_pg_graphql_access"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


--
-- Name: FUNCTION "grant_pg_graphql_access"(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION "extensions"."grant_pg_graphql_access"() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION "extensions"."grant_pg_net_access"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM pg_event_trigger_ddl_commands() AS ev
      JOIN pg_extension AS ext
      ON ev.objid = ext.oid
      WHERE ext.extname = 'pg_net'
    )
    THEN
      GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

      IF EXISTS (
        SELECT FROM pg_extension
        WHERE extname = 'pg_net'
        -- all versions in use on existing projects as of 2025-02-20
        -- version 0.12.0 onwards don't need these applied
        AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
      ) THEN
        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

        REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
        REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

        GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
        GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      END IF;
    END IF;
  END;
  $$;


--
-- Name: FUNCTION "grant_pg_net_access"(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION "extensions"."grant_pg_net_access"() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION "extensions"."pgrst_ddl_watch"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION "extensions"."pgrst_drop_watch"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION "extensions"."set_graphql_placeholder"() RETURNS "event_trigger"
    LANGUAGE "plpgsql"
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- Name: FUNCTION "set_graphql_placeholder"(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION "extensions"."set_graphql_placeholder"() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth("text"); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION "pgbouncer"."get_auth"("p_usename" "text") RETURNS TABLE("username" "text", "password" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


--
-- Name: fn_create_default_settings(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."fn_create_default_settings"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
    INSERT INTO tenant_settings (user_id, trade_name)
    VALUES (NEW.id, 'Minha Assistência')
    ON CONFLICT (user_id) DO NOTHING;
    RETURN NEW;
END;
$$;


--
-- Name: fn_log_order_status_change(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."fn_log_order_status_change"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
    -- Só loga se o status realmente mudou
    IF OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO order_logs (
            order_id,
            previous_status,
            new_status,
            changed_by,
            metadata
        ) VALUES (
            NEW.id,
            OLD.status,
            NEW.status,
            auth.uid(),
            jsonb_build_object(
                'triggered_at', NOW(),
                'trigger_type', 'automatic'
            )
        );
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: generate_smart_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."generate_smart_id"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  current_year INT;
  user_prefix VARCHAR(3);
  next_seq INTEGER;
  new_smart_id TEXT;
  tenant_record RECORD;
BEGIN
  -- Get Current Year
  current_year := EXTRACT(YEAR FROM NOW())::INT;
  
  -- Get User Prefix (Default 'WT' if not found)
  SELECT os_prefix INTO user_prefix 
  FROM tenants 
  WHERE id = NEW.user_id;
  
  IF user_prefix IS NULL THEN
    user_prefix := 'WT';
    -- Auto-create tenant record if missing
    INSERT INTO tenants (id, os_prefix) VALUES (NEW.user_id, 'WT') ON CONFLICT DO NOTHING;
  END IF;

  -- ADVISORY LOCK: Prevent race conditions for this user
  -- Cast UUID to BigInt logic or hashing for the lock key.
  -- Simpler: Lock based on user_id hash.
  PERFORM pg_advisory_xact_lock(hashtext(NEW.user_id::text));

  -- Get Max Sequential Number for this User + Year
  SELECT COALESCE(MAX(sequential_number), 0) + 1 INTO next_seq
  FROM orders
  WHERE user_id = NEW.user_id
    AND EXTRACT(YEAR FROM created_at)::INT = current_year;

  -- Format Smart ID: 2026WT-0001
  new_smart_id := current_year || user_prefix || '-' || LPAD(next_seq::TEXT, 4, '0');

  -- Assign to NEW row
  NEW.sequential_number := next_seq;
  NEW.display_id := new_smart_id;

  RETURN NEW;
END;
$$;


--
-- Name: notify_n8n_new_schedule(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."notify_n8n_new_schedule"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
  webhook_url TEXT := 'https://primary-production-0ef575.up.railway.app/webhook-test/agendamentos'; 
BEGIN
  PERFORM net.http_post(
    url := webhook_url,
    headers := '{"Content-Type": "application/json"}'::jsonb,
    body := jsonb_build_object(
      'type', 'INSERT',
      'table', 'schedules',
      'record', row_to_json(NEW)
    )
  );
  RETURN NEW;
END;
$$;


--
-- Name: notify_n8n_on_schedule_change(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."notify_n8n_on_schedule_change"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
  webhook_url TEXT := 'https://n8n.wfixtech.com.br/webhook/agendamentos'; 
BEGIN
  -- Só disparar se o status mudou para 'confirmed' OU se foi um INSERT já confirmado
  IF (TG_OP = 'INSERT' AND NEW.status = 'confirmed') OR 
     (TG_OP = 'UPDATE' AND NEW.status = 'confirmed' AND OLD.status != 'confirmed') THEN
     
    PERFORM net.http_post(
      url := webhook_url,
      headers := '{"Content-Type": "application/json"}'::jsonb,
      body := jsonb_build_object(
        'type', TG_OP,
        'table', 'schedules',
        'record', row_to_json(NEW)
      )
    );
  END IF;
  
  RETURN NEW;
END;
$$;


--
-- Name: update_active_leads_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."update_active_leads_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


--
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."update_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


--
-- Name: apply_rls("jsonb", integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."apply_rls"("wal" "jsonb", "max_record_bytes" integer DEFAULT (1024 * 1024)) RETURNS SETOF "realtime"."wal_rls"
    LANGUAGE "plpgsql"
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


--
-- Name: broadcast_changes("text", "text", "text", "text", "text", "record", "record", "text"); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."broadcast_changes"("topic_name" "text", "event_name" "text", "operation" "text", "table_name" "text", "table_schema" "text", "new" "record", "old" "record", "level" "text" DEFAULT 'ROW'::"text") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


--
-- Name: build_prepared_statement_sql("text", "regclass", "realtime"."wal_column"[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."build_prepared_statement_sql"("prepared_statement_name" "text", "entity" "regclass", "columns" "realtime"."wal_column"[]) RETURNS "text"
    LANGUAGE "sql"
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- Name: cast("text", "regtype"); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."cast"("val" "text", "type_" "regtype") RETURNS "jsonb"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


--
-- Name: check_equality_op("realtime"."equality_op", "regtype", "text", "text"); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."check_equality_op"("op" "realtime"."equality_op", "type_" "regtype", "val_1" "text", "val_2" "text") RETURNS boolean
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


--
-- Name: is_visible_through_filters("realtime"."wal_column"[], "realtime"."user_defined_filter"[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."is_visible_through_filters"("columns" "realtime"."wal_column"[], "filters" "realtime"."user_defined_filter"[]) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


--
-- Name: list_changes("name", "name", integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."list_changes"("publication" "name", "slot_name" "name", "max_changes" integer, "max_record_bytes" integer) RETURNS SETOF "realtime"."wal_rls"
    LANGUAGE "sql"
    SET "log_min_messages" TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


--
-- Name: quote_wal2json("regclass"); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."quote_wal2json"("entity" "regclass") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


--
-- Name: send("jsonb", "text", "text", boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."send"("payload" "jsonb", "event" "text", "topic" "text", "private" boolean DEFAULT true) RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."subscription_check_filters"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


--
-- Name: to_regrole("text"); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."to_regrole"("role_name" "text") RETURNS "regrole"
    LANGUAGE "sql" IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION "realtime"."topic"() RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: can_insert_object("text", "text", "uuid", "jsonb"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."can_insert_object"("bucketid" "text", "name" "text", "owner" "uuid", "metadata" "jsonb") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- Name: delete_leaf_prefixes("text"[], "text"[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."delete_leaf_prefixes"("bucket_ids" "text"[], "names" "text"[]) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."enforce_bucket_name_length"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


--
-- Name: extension("text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."extension"("name" "text") RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


--
-- Name: filename("text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."filename"("name" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


--
-- Name: foldername("text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."foldername"("name" "text") RETURNS "text"[]
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


--
-- Name: get_common_prefix("text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."get_common_prefix"("p_key" "text", "p_prefix" "text", "p_delimiter" "text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


--
-- Name: get_level("text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."get_level"("name" "text") RETURNS integer
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


--
-- Name: get_prefix("text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."get_prefix"("name" "text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


--
-- Name: get_prefixes("text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."get_prefixes"("name" "text") RETURNS "text"[]
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."get_size_by_bucket"() RETURNS TABLE("size" bigint, "bucket_id" "text")
    LANGUAGE "plpgsql" STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- Name: list_multipart_uploads_with_delimiter("text", "text", "text", integer, "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."list_multipart_uploads_with_delimiter"("bucket_id" "text", "prefix_param" "text", "delimiter_param" "text", "max_keys" integer DEFAULT 100, "next_key_token" "text" DEFAULT ''::"text", "next_upload_token" "text" DEFAULT ''::"text") RETURNS TABLE("key" "text", "id" "text", "created_at" timestamp with time zone)
    LANGUAGE "plpgsql"
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- Name: list_objects_with_delimiter("text", "text", "text", integer, "text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."list_objects_with_delimiter"("_bucket_id" "text", "prefix_param" "text", "delimiter_param" "text", "max_keys" integer DEFAULT 100, "start_after" "text" DEFAULT ''::"text", "next_token" "text" DEFAULT ''::"text", "sort_order" "text" DEFAULT 'asc'::"text") RETURNS TABLE("name" "text", "id" "uuid", "metadata" "jsonb", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone)
    LANGUAGE "plpgsql" STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."operation"() RETURNS "text"
    LANGUAGE "plpgsql" STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."protect_delete"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


--
-- Name: search("text", "text", integer, integer, integer, "text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."search"("prefix" "text", "bucketname" "text", "limits" integer DEFAULT 100, "levels" integer DEFAULT 1, "offsets" integer DEFAULT 0, "search" "text" DEFAULT ''::"text", "sortcolumn" "text" DEFAULT 'name'::"text", "sortorder" "text" DEFAULT 'asc'::"text") RETURNS TABLE("name" "text", "id" "uuid", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone, "metadata" "jsonb")
    LANGUAGE "plpgsql" STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


--
-- Name: search_by_timestamp("text", "text", integer, integer, "text", "text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."search_by_timestamp"("p_prefix" "text", "p_bucket_id" "text", "p_limit" integer, "p_level" integer, "p_start_after" "text", "p_sort_order" "text", "p_sort_column" "text", "p_sort_column_after" "text") RETURNS TABLE("key" "text", "name" "text", "id" "uuid", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone, "metadata" "jsonb")
    LANGUAGE "plpgsql" STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


--
-- Name: search_legacy_v1("text", "text", integer, integer, integer, "text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."search_legacy_v1"("prefix" "text", "bucketname" "text", "limits" integer DEFAULT 100, "levels" integer DEFAULT 1, "offsets" integer DEFAULT 0, "search" "text" DEFAULT ''::"text", "sortcolumn" "text" DEFAULT 'name'::"text", "sortorder" "text" DEFAULT 'asc'::"text") RETURNS TABLE("name" "text", "id" "uuid", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone, "metadata" "jsonb")
    LANGUAGE "plpgsql" STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: search_v2("text", "text", integer, integer, "text", "text", "text", "text"); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."search_v2"("prefix" "text", "bucket_name" "text", "limits" integer DEFAULT 100, "levels" integer DEFAULT 1, "start_after" "text" DEFAULT ''::"text", "sort_order" "text" DEFAULT 'asc'::"text", "sort_column" "text" DEFAULT 'name'::"text", "sort_column_after" "text" DEFAULT ''::"text") RETURNS TABLE("key" "text", "name" "text", "id" "uuid", "updated_at" timestamp with time zone, "created_at" timestamp with time zone, "last_accessed_at" timestamp with time zone, "metadata" "jsonb")
    LANGUAGE "plpgsql" STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION "storage"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: -
--

CREATE FUNCTION "supabase_functions"."http_request"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."audit_log_entries" (
    "instance_id" "uuid",
    "id" "uuid" NOT NULL,
    "payload" json,
    "created_at" timestamp with time zone,
    "ip_address" character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE "audit_log_entries"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."audit_log_entries" IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."flow_state" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid",
    "auth_code" "text",
    "code_challenge_method" "auth"."code_challenge_method",
    "code_challenge" "text",
    "provider_type" "text" NOT NULL,
    "provider_access_token" "text",
    "provider_refresh_token" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "authentication_method" "text" NOT NULL,
    "auth_code_issued_at" timestamp with time zone,
    "invite_token" "text",
    "referrer" "text",
    "oauth_client_state_id" "uuid",
    "linking_target_id" "uuid",
    "email_optional" boolean DEFAULT false NOT NULL
);


--
-- Name: TABLE "flow_state"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."flow_state" IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."identities" (
    "provider_id" "text" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "identity_data" "jsonb" NOT NULL,
    "provider" "text" NOT NULL,
    "last_sign_in_at" timestamp with time zone,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "email" "text" GENERATED ALWAYS AS ("lower"(("identity_data" ->> 'email'::"text"))) STORED,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: TABLE "identities"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."identities" IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN "identities"."email"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."identities"."email" IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."instances" (
    "id" "uuid" NOT NULL,
    "uuid" "uuid",
    "raw_base_config" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone
);


--
-- Name: TABLE "instances"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."instances" IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."mfa_amr_claims" (
    "session_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone NOT NULL,
    "authentication_method" "text" NOT NULL,
    "id" "uuid" NOT NULL
);


--
-- Name: TABLE "mfa_amr_claims"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."mfa_amr_claims" IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."mfa_challenges" (
    "id" "uuid" NOT NULL,
    "factor_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "verified_at" timestamp with time zone,
    "ip_address" "inet" NOT NULL,
    "otp_code" "text",
    "web_authn_session_data" "jsonb"
);


--
-- Name: TABLE "mfa_challenges"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."mfa_challenges" IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."mfa_factors" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "friendly_name" "text",
    "factor_type" "auth"."factor_type" NOT NULL,
    "status" "auth"."factor_status" NOT NULL,
    "created_at" timestamp with time zone NOT NULL,
    "updated_at" timestamp with time zone NOT NULL,
    "secret" "text",
    "phone" "text",
    "last_challenged_at" timestamp with time zone,
    "web_authn_credential" "jsonb",
    "web_authn_aaguid" "uuid",
    "last_webauthn_challenge_data" "jsonb"
);


--
-- Name: TABLE "mfa_factors"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."mfa_factors" IS 'auth: stores metadata about factors';


--
-- Name: COLUMN "mfa_factors"."last_webauthn_challenge_data"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."mfa_factors"."last_webauthn_challenge_data" IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."oauth_authorizations" (
    "id" "uuid" NOT NULL,
    "authorization_id" "text" NOT NULL,
    "client_id" "uuid" NOT NULL,
    "user_id" "uuid",
    "redirect_uri" "text" NOT NULL,
    "scope" "text" NOT NULL,
    "state" "text",
    "resource" "text",
    "code_challenge" "text",
    "code_challenge_method" "auth"."code_challenge_method",
    "response_type" "auth"."oauth_response_type" DEFAULT 'code'::"auth"."oauth_response_type" NOT NULL,
    "status" "auth"."oauth_authorization_status" DEFAULT 'pending'::"auth"."oauth_authorization_status" NOT NULL,
    "authorization_code" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "expires_at" timestamp with time zone DEFAULT ("now"() + '00:03:00'::interval) NOT NULL,
    "approved_at" timestamp with time zone,
    "nonce" "text",
    CONSTRAINT "oauth_authorizations_authorization_code_length" CHECK (("char_length"("authorization_code") <= 255)),
    CONSTRAINT "oauth_authorizations_code_challenge_length" CHECK (("char_length"("code_challenge") <= 128)),
    CONSTRAINT "oauth_authorizations_expires_at_future" CHECK (("expires_at" > "created_at")),
    CONSTRAINT "oauth_authorizations_nonce_length" CHECK (("char_length"("nonce") <= 255)),
    CONSTRAINT "oauth_authorizations_redirect_uri_length" CHECK (("char_length"("redirect_uri") <= 2048)),
    CONSTRAINT "oauth_authorizations_resource_length" CHECK (("char_length"("resource") <= 2048)),
    CONSTRAINT "oauth_authorizations_scope_length" CHECK (("char_length"("scope") <= 4096)),
    CONSTRAINT "oauth_authorizations_state_length" CHECK (("char_length"("state") <= 4096))
);


--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."oauth_client_states" (
    "id" "uuid" NOT NULL,
    "provider_type" "text" NOT NULL,
    "code_verifier" "text",
    "created_at" timestamp with time zone NOT NULL
);


--
-- Name: TABLE "oauth_client_states"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."oauth_client_states" IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."oauth_clients" (
    "id" "uuid" NOT NULL,
    "client_secret_hash" "text",
    "registration_type" "auth"."oauth_registration_type" NOT NULL,
    "redirect_uris" "text" NOT NULL,
    "grant_types" "text" NOT NULL,
    "client_name" "text",
    "client_uri" "text",
    "logo_uri" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "deleted_at" timestamp with time zone,
    "client_type" "auth"."oauth_client_type" DEFAULT 'confidential'::"auth"."oauth_client_type" NOT NULL,
    "token_endpoint_auth_method" "text" NOT NULL,
    CONSTRAINT "oauth_clients_client_name_length" CHECK (("char_length"("client_name") <= 1024)),
    CONSTRAINT "oauth_clients_client_uri_length" CHECK (("char_length"("client_uri") <= 2048)),
    CONSTRAINT "oauth_clients_logo_uri_length" CHECK (("char_length"("logo_uri") <= 2048)),
    CONSTRAINT "oauth_clients_token_endpoint_auth_method_check" CHECK (("token_endpoint_auth_method" = ANY (ARRAY['client_secret_basic'::"text", 'client_secret_post'::"text", 'none'::"text"])))
);


--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."oauth_consents" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "client_id" "uuid" NOT NULL,
    "scopes" "text" NOT NULL,
    "granted_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "revoked_at" timestamp with time zone,
    CONSTRAINT "oauth_consents_revoked_after_granted" CHECK ((("revoked_at" IS NULL) OR ("revoked_at" >= "granted_at"))),
    CONSTRAINT "oauth_consents_scopes_length" CHECK (("char_length"("scopes") <= 2048)),
    CONSTRAINT "oauth_consents_scopes_not_empty" CHECK (("char_length"(TRIM(BOTH FROM "scopes")) > 0))
);


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."one_time_tokens" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "token_type" "auth"."one_time_token_type" NOT NULL,
    "token_hash" "text" NOT NULL,
    "relates_to" "text" NOT NULL,
    "created_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "one_time_tokens_token_hash_check" CHECK (("char_length"("token_hash") > 0))
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."refresh_tokens" (
    "instance_id" "uuid",
    "id" bigint NOT NULL,
    "token" character varying(255),
    "user_id" character varying(255),
    "revoked" boolean,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "parent" character varying(255),
    "session_id" "uuid"
);


--
-- Name: TABLE "refresh_tokens"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."refresh_tokens" IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE "auth"."refresh_tokens_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE "auth"."refresh_tokens_id_seq" OWNED BY "auth"."refresh_tokens"."id";


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."saml_providers" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "entity_id" "text" NOT NULL,
    "metadata_xml" "text" NOT NULL,
    "metadata_url" "text",
    "attribute_mapping" "jsonb",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "name_id_format" "text",
    CONSTRAINT "entity_id not empty" CHECK (("char_length"("entity_id") > 0)),
    CONSTRAINT "metadata_url not empty" CHECK ((("metadata_url" = NULL::"text") OR ("char_length"("metadata_url") > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK (("char_length"("metadata_xml") > 0))
);


--
-- Name: TABLE "saml_providers"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."saml_providers" IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."saml_relay_states" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "request_id" "text" NOT NULL,
    "for_email" "text",
    "redirect_to" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "flow_state_id" "uuid",
    CONSTRAINT "request_id not empty" CHECK (("char_length"("request_id") > 0))
);


--
-- Name: TABLE "saml_relay_states"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."saml_relay_states" IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."schema_migrations" (
    "version" character varying(255) NOT NULL
);


--
-- Name: TABLE "schema_migrations"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."schema_migrations" IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."sessions" (
    "id" "uuid" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "factor_id" "uuid",
    "aal" "auth"."aal_level",
    "not_after" timestamp with time zone,
    "refreshed_at" timestamp without time zone,
    "user_agent" "text",
    "ip" "inet",
    "tag" "text",
    "oauth_client_id" "uuid",
    "refresh_token_hmac_key" "text",
    "refresh_token_counter" bigint,
    "scopes" "text",
    CONSTRAINT "sessions_scopes_length" CHECK (("char_length"("scopes") <= 4096))
);


--
-- Name: TABLE "sessions"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."sessions" IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN "sessions"."not_after"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."sessions"."not_after" IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN "sessions"."refresh_token_hmac_key"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."sessions"."refresh_token_hmac_key" IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN "sessions"."refresh_token_counter"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."sessions"."refresh_token_counter" IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."sso_domains" (
    "id" "uuid" NOT NULL,
    "sso_provider_id" "uuid" NOT NULL,
    "domain" "text" NOT NULL,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK (("char_length"("domain") > 0))
);


--
-- Name: TABLE "sso_domains"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."sso_domains" IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."sso_providers" (
    "id" "uuid" NOT NULL,
    "resource_id" "text",
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "disabled" boolean,
    CONSTRAINT "resource_id not empty" CHECK ((("resource_id" = NULL::"text") OR ("char_length"("resource_id") > 0)))
);


--
-- Name: TABLE "sso_providers"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."sso_providers" IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN "sso_providers"."resource_id"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."sso_providers"."resource_id" IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE "auth"."users" (
    "instance_id" "uuid",
    "id" "uuid" NOT NULL,
    "aud" character varying(255),
    "role" character varying(255),
    "email" character varying(255),
    "encrypted_password" character varying(255),
    "email_confirmed_at" timestamp with time zone,
    "invited_at" timestamp with time zone,
    "confirmation_token" character varying(255),
    "confirmation_sent_at" timestamp with time zone,
    "recovery_token" character varying(255),
    "recovery_sent_at" timestamp with time zone,
    "email_change_token_new" character varying(255),
    "email_change" character varying(255),
    "email_change_sent_at" timestamp with time zone,
    "last_sign_in_at" timestamp with time zone,
    "raw_app_meta_data" "jsonb",
    "raw_user_meta_data" "jsonb",
    "is_super_admin" boolean,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "phone" "text" DEFAULT NULL::character varying,
    "phone_confirmed_at" timestamp with time zone,
    "phone_change" "text" DEFAULT ''::character varying,
    "phone_change_token" character varying(255) DEFAULT ''::character varying,
    "phone_change_sent_at" timestamp with time zone,
    "confirmed_at" timestamp with time zone GENERATED ALWAYS AS (LEAST("email_confirmed_at", "phone_confirmed_at")) STORED,
    "email_change_token_current" character varying(255) DEFAULT ''::character varying,
    "email_change_confirm_status" smallint DEFAULT 0,
    "banned_until" timestamp with time zone,
    "reauthentication_token" character varying(255) DEFAULT ''::character varying,
    "reauthentication_sent_at" timestamp with time zone,
    "is_sso_user" boolean DEFAULT false NOT NULL,
    "deleted_at" timestamp with time zone,
    "is_anonymous" boolean DEFAULT false NOT NULL,
    CONSTRAINT "users_email_change_confirm_status_check" CHECK ((("email_change_confirm_status" >= 0) AND ("email_change_confirm_status" <= 2)))
);


--
-- Name: TABLE "users"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE "auth"."users" IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN "users"."is_sso_user"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN "auth"."users"."is_sso_user" IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "phone" "text",
    "document_id" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"()
);


--
-- Name: equipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."equipments" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "customer_id" "uuid" NOT NULL,
    "type" "text",
    "brand" "text",
    "model" "text",
    "serial_number" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "remote_access_id" "text",
    "remote_access_password" "text"
);


--
-- Name: COLUMN "equipments"."serial_number"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."equipments"."serial_number" IS 'Serial Number or Service Tag of the equipment';


--
-- Name: COLUMN "equipments"."remote_access_id"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."equipments"."remote_access_id" IS 'ID for remote access (e.g. AnyDesk, TeamViewer)';


--
-- Name: COLUMN "equipments"."remote_access_password"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."equipments"."remote_access_password" IS 'Password for remote access (should be treated with care)';


--
-- Name: follow_ups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."follow_ups" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "customer_id" "uuid",
    "type" "text" NOT NULL,
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "scheduled_for" "date" NOT NULL,
    "completed_at" timestamp with time zone,
    "skipped_at" timestamp with time zone,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "follow_ups_status_check" CHECK (("status" = ANY (ARRAY['pending'::"text", 'completed'::"text", 'skipped'::"text"]))),
    CONSTRAINT "follow_ups_type_check" CHECK (("type" = ANY (ARRAY['post_delivery'::"text", 'warranty_check'::"text", 'warranty_expiring'::"text", 'manual'::"text"])))
);


--
-- Name: TABLE "follow_ups"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."follow_ups" IS 'Customer follow-up tracking for warranty and post-service care';


--
-- Name: COLUMN "follow_ups"."type"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."follow_ups"."type" IS 'post_delivery=7d after, warranty_check=mid-warranty, warranty_expiring=7d before end, manual=custom';


--
-- Name: hardware_telemetry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."hardware_telemetry" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "equipment_id" "uuid" NOT NULL,
    "tenant_id" "uuid" NOT NULL,
    "source_type" "text" NOT NULL,
    "ssd_health_percent" integer,
    "ssd_tbw" numeric(10,2),
    "cpu_temp_max" numeric(5,1),
    "battery_cycles" integer,
    "battery_wear_level" integer,
    "raw_content" "text",
    "health_score" integer,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "cpu_model" "text",
    "motherboard_model" "text",
    "ram_total_gb" integer,
    "gpu_model" "text",
    "stage" "text" DEFAULT 'initial'::"text",
    "ssd_total_gb" integer,
    "ram_speed" integer,
    "ram_slots" integer,
    CONSTRAINT "hardware_telemetry_battery_wear_level_check" CHECK ((("battery_wear_level" >= 0) AND ("battery_wear_level" <= 100))),
    CONSTRAINT "hardware_telemetry_health_score_check" CHECK ((("health_score" >= 0) AND ("health_score" <= 100))),
    CONSTRAINT "hardware_telemetry_source_type_check" CHECK (("source_type" = ANY (ARRAY['crystaldisk'::"text", 'hwinfo'::"text", 'hwmonitor'::"text", 'manual'::"text"]))),
    CONSTRAINT "hardware_telemetry_ssd_health_percent_check" CHECK ((("ssd_health_percent" >= 0) AND ("ssd_health_percent" <= 100))),
    CONSTRAINT "hardware_telemetry_stage_check" CHECK (("stage" = ANY (ARRAY['initial'::"text", 'post_repair'::"text", 'final'::"text"])))
);


--
-- Name: COLUMN "hardware_telemetry"."stage"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."hardware_telemetry"."stage" IS 'Repair stage: initial (diagnosis), post_repair (after service), final (delivery check)';


--
-- Name: COLUMN "hardware_telemetry"."ssd_total_gb"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."hardware_telemetry"."ssd_total_gb" IS 'Total SSD capacity in GB';


--
-- Name: COLUMN "hardware_telemetry"."ram_speed"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."hardware_telemetry"."ram_speed" IS 'RAM Frequency in MHz';


--
-- Name: COLUMN "hardware_telemetry"."ram_slots"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."hardware_telemetry"."ram_slots" IS 'Number of occupied RAM slots';


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."leads" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "name" "text",
    "email" "text",
    "company" "text",
    "message" "text",
    "source" "text" DEFAULT 'ads_bridge_page'::"text",
    "tenant_id" "uuid",
    "company_name" "text",
    "phone" "text",
    "device_count" "text",
    "service_interest" "text"[],
    "status" "text" DEFAULT 'new'::"text",
    CONSTRAINT "leads_device_count_check" CHECK (("device_count" = ANY (ARRAY['1-5'::"text", '6-20'::"text", '21-100'::"text", '100+'::"text"]))),
    CONSTRAINT "leads_status_check" CHECK (("status" = ANY (ARRAY['new'::"text", 'contacted'::"text", 'converted'::"text", 'lost'::"text", 'spam'::"text"])))
);


--
-- Name: TABLE "leads"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."leads" IS 'Tabela de leads corporativos (B2B)';


--
-- Name: nps_feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."nps_feedbacks" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "customer_id" "uuid" NOT NULL,
    "score" integer NOT NULL,
    "comment" "text",
    "discount_code" "text",
    "is_redeemed" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "clicked_google_review" boolean DEFAULT false,
    "clicked_google_review_at" timestamp with time zone,
    CONSTRAINT "nps_feedbacks_score_check" CHECK ((("score" >= 0) AND ("score" <= 10)))
);


--
-- Name: COLUMN "nps_feedbacks"."score"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."nps_feedbacks"."score" IS 'Net Promoter Score (0-10)';


--
-- Name: COLUMN "nps_feedbacks"."discount_code"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."nps_feedbacks"."discount_code" IS 'Generated code for 20% labor discount if score >= 9';


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."order_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "title" "text" NOT NULL,
    "type" "public"."order_item_type" DEFAULT 'service'::"public"."order_item_type" NOT NULL,
    "price" numeric(10,2) DEFAULT 0.00,
    "external_url" "text",
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "is_external_part" boolean DEFAULT false,
    "part_status" "text" DEFAULT 'pending'::"text",
    "estimated_price" numeric(10,2),
    CONSTRAINT "order_items_part_status_check" CHECK (("part_status" = ANY (ARRAY['pending'::"text", 'ordered'::"text", 'arrived'::"text"])))
);


--
-- Name: COLUMN "order_items"."external_url"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."order_items"."external_url" IS 'Link de compra externa (Mercado Livre, etc)';


--
-- Name: COLUMN "order_items"."is_external_part"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."order_items"."is_external_part" IS 'True se a peça é comprada externamente pelo cliente';


--
-- Name: COLUMN "order_items"."part_status"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."order_items"."part_status" IS 'Status da peça: pending, ordered, arrived';


--
-- Name: COLUMN "order_items"."estimated_price"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."order_items"."estimated_price" IS 'Preço estimado da peça (apenas informativo)';


--
-- Name: order_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."order_logs" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "previous_status" "text",
    "new_status" "text" NOT NULL,
    "changed_by" "uuid",
    "changed_by_type" "text" DEFAULT 'technician'::"text",
    "metadata" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "order_logs_changed_by_type_check" CHECK (("changed_by_type" = ANY (ARRAY['technician'::"text", 'customer'::"text", 'system'::"text"]))),
    CONSTRAINT "order_logs_status_check" CHECK (("new_status" = ANY (ARRAY['open'::"text", 'analyzing'::"text", 'waiting_approval'::"text", 'waiting_parts'::"text", 'in_progress'::"text", 'ready'::"text", 'finished'::"text", 'canceled'::"text"])))
);


--
-- Name: TABLE "order_logs"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."order_logs" IS 'Trilha de auditoria imutável para mudanças de status das OS';


--
-- Name: COLUMN "order_logs"."metadata"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."order_logs"."metadata" IS 'Dados extras: {reason, tracking_code, ip, userAgent}';


--
-- Name: COLUMN "order_logs"."created_at"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."order_logs"."created_at" IS 'Timestamp em UTC - converter para America/Sao_Paulo na exibição';


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."orders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "display_id" "text" NOT NULL,
    "user_id" "uuid" NOT NULL,
    "customer_id" "uuid",
    "equipment_id" "uuid",
    "status" "public"."order_status" DEFAULT 'open'::"public"."order_status" NOT NULL,
    "labor_cost" numeric(10,2) DEFAULT 0.00,
    "parts_cost_external" numeric(10,2) DEFAULT 0.00,
    "diagnosis_text" "text",
    "solution_text" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "finished_at" timestamp with time zone,
    "canceled_at" timestamp with time zone,
    "approved_at" timestamp with time zone,
    "payment_method" "text",
    "amount_received" numeric(10,2),
    "payment_received_at" timestamp with time zone,
    "part_arrival_date" timestamp with time zone,
    "signature_metadata" "jsonb",
    "photos_checkin" "text"[] DEFAULT '{}'::"text"[],
    "photos_checkout" "text"[] DEFAULT '{}'::"text"[],
    "integrity_hash" "text",
    "execution_tasks" "jsonb" DEFAULT '[]'::"jsonb",
    "sequential_number" integer,
    "signature_evidence" "jsonb",
    "store_snapshot" "jsonb",
    "accessories_received" "text"[],
    "custody_conditions" "text",
    "custody_geo_lat" double precision,
    "custody_geo_lng" double precision,
    "custody_integrity_hash" "text",
    "custody_signature_url" "text",
    "custody_signed_at" timestamp with time zone,
    "custody_ip" "text",
    "custody_photos" "jsonb" DEFAULT '[]'::"jsonb",
    "problem_description" "text",
    "discount_amount" numeric DEFAULT 0,
    "coupon_code" "text",
    "warranty_days" integer DEFAULT 90,
    "warranty_start_date" timestamp with time zone,
    "warranty_end_date" timestamp with time zone,
    "checkout_checklist" "jsonb",
    "parts_sourcing_mode" "text" DEFAULT 'assisted'::"text",
    CONSTRAINT "orders_payment_method_check" CHECK (("payment_method" = ANY (ARRAY['pix'::"text", 'cash'::"text", 'card_machine'::"text"])))
);


--
-- Name: COLUMN "orders"."finished_at"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."finished_at" IS 'Data/hora de finalização da OS';


--
-- Name: COLUMN "orders"."canceled_at"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."canceled_at" IS 'Data em que a OS foi cancelada';


--
-- Name: COLUMN "orders"."approved_at"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."approved_at" IS 'Momento exato da aprovação do orçamento pelo cliente';


--
-- Name: COLUMN "orders"."payment_method"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."payment_method" IS 'Método de pagamento: pix, cash (dinheiro), card_machine (maquininha)';


--
-- Name: COLUMN "orders"."amount_received"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."amount_received" IS 'Valor efetivamente recebido pelo técnico';


--
-- Name: COLUMN "orders"."payment_received_at"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."payment_received_at" IS 'Data/hora do recebimento do pagamento';


--
-- Name: COLUMN "orders"."part_arrival_date"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."part_arrival_date" IS 'Data em que a peça externa chegou na assistência';


--
-- Name: COLUMN "orders"."signature_metadata"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."signature_metadata" IS 'Metadados da assinatura digital: {ip, user_agent, geo: {lat, lng, accuracy}, geo_denied, device_fingerprint}';


--
-- Name: COLUMN "orders"."photos_checkin"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."photos_checkin" IS 'Array de URLs das fotos tiradas na entrada do aparelho';


--
-- Name: COLUMN "orders"."photos_checkout"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."photos_checkout" IS 'Array de URLs das fotos tiradas na entrega do aparelho';


--
-- Name: COLUMN "orders"."integrity_hash"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."integrity_hash" IS 'Hash SHA-256 para verificação de integridade: ID+DATA+VALOR+IP';


--
-- Name: COLUMN "orders"."execution_tasks"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."execution_tasks" IS 'Array de sub-tarefas: [{id, title, completed, completed_at}]';


--
-- Name: COLUMN "orders"."store_snapshot"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."store_snapshot" IS 'Snapshot of tenant settings (name, address, legal) at the time of order completion for immutable receipts.';


--
-- Name: COLUMN "orders"."accessories_received"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."accessories_received" IS 'List of accessories collected from the customer';


--
-- Name: COLUMN "orders"."custody_conditions"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."custody_conditions" IS 'Description of physical conditions/damages reported during check-in';


--
-- Name: COLUMN "orders"."custody_ip"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."custody_ip" IS 'Endereço IP do dispositivo que assinou o termo de custódia';


--
-- Name: COLUMN "orders"."custody_photos"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."custody_photos" IS 'List of photos taken during check-in (url, label)';


--
-- Name: COLUMN "orders"."problem_description"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."problem_description" IS 'Original description of the problem provided by the customer/checkin';


--
-- Name: COLUMN "orders"."discount_amount"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."orders"."discount_amount" IS 'Discount value applied to labor cost';


--
-- Name: orders_display_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."orders_display_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."orders_display_id_seq" OWNED BY "public"."orders"."display_id";


--
-- Name: schedule_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."schedule_settings" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "work_days" integer[] DEFAULT '{1,2,3,4,5}'::integer[] NOT NULL,
    "start_time" time without time zone DEFAULT '09:00:00'::time without time zone NOT NULL,
    "end_time" time without time zone DEFAULT '18:00:00'::time without time zone NOT NULL,
    "slot_duration_minutes" integer DEFAULT 60 NOT NULL,
    "lunch_start" time without time zone DEFAULT '12:00:00'::time without time zone,
    "lunch_end" time without time zone DEFAULT '13:00:00'::time without time zone,
    "max_advance_days" integer DEFAULT 30 NOT NULL,
    "token_expiry_hours" integer DEFAULT 48 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."schedules" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "customer_id" "uuid",
    "order_id" "uuid",
    "token" character varying(64) NOT NULL,
    "status" "public"."schedule_status" DEFAULT 'pending'::"public"."schedule_status" NOT NULL,
    "scheduled_date" "date",
    "scheduled_time" time without time zone,
    "customer_name" character varying(255),
    "customer_phone" character varying(30),
    "notes" "text",
    "expires_at" timestamp with time zone NOT NULL,
    "confirmed_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "duration_minutes" integer DEFAULT 120 NOT NULL
);

ALTER TABLE ONLY "public"."schedules" REPLICA IDENTITY FULL;


--
-- Name: service_catalog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."service_catalog" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "tenant_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text" NOT NULL,
    "price_min" numeric(10,2) NOT NULL,
    "price_max" numeric(10,2) NOT NULL,
    "category" "text" NOT NULL,
    "active" boolean DEFAULT true NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "estimated_time" "text"
);


--
-- Name: task_presets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."task_presets" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "tasks" "jsonb" DEFAULT '[]'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL
);


--
-- Name: technical_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."technical_reports" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid" NOT NULL,
    "tenant_id" "uuid" NOT NULL,
    "technical_analysis" "text" NOT NULL,
    "tests_performed" "jsonb" DEFAULT '[]'::"jsonb",
    "conclusion" "text" NOT NULL,
    "photos_evidence" "text"[] DEFAULT ARRAY[]::"text"[],
    "pdf_url" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: tenant_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tenant_settings" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "trade_name" "text" DEFAULT 'Minha Assistência'::"text" NOT NULL,
    "legal_document" "text",
    "phone" "text",
    "email" "text",
    "address" "jsonb" DEFAULT '{}'::"jsonb",
    "logo_url" "text",
    "pix_key" "text",
    "pix_key_type" "text",
    "mei_limit_annual" numeric(12,2) DEFAULT 81000.00 NOT NULL,
    "mei_limit_monthly" numeric(12,2) GENERATED ALWAYS AS (("mei_limit_annual" / (12)::numeric)) STORED,
    "warranty_days_labor" integer DEFAULT 90 NOT NULL,
    "warranty_days_parts" integer DEFAULT 0 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "tenant_settings_pix_key_type_check" CHECK (("pix_key_type" = ANY (ARRAY['cpf'::"text", 'cnpj'::"text", 'email'::"text", 'phone'::"text", 'random'::"text"])))
);


--
-- Name: TABLE "tenant_settings"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."tenant_settings" IS 'Configurações personalizáveis por técnico/loja';


--
-- Name: COLUMN "tenant_settings"."address"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."tenant_settings"."address" IS 'Formato: {street, number, complement, neighborhood, city, state, zip}';


--
-- Name: COLUMN "tenant_settings"."mei_limit_annual"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN "public"."tenant_settings"."mei_limit_annual" IS 'Teto MEI anual (R$ 81k atual, R$ 140-150k Super MEI futuro)';


--
-- Name: tenants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tenants" (
    "id" "uuid" NOT NULL,
    "os_prefix" character varying(3) DEFAULT 'WT'::character varying,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "trade_name" "text" DEFAULT 'Minha Assistência'::"text",
    "legal_document" "text",
    "phone" "text",
    "website" "text",
    "email" "text",
    "address" "jsonb" DEFAULT '{}'::"jsonb",
    "warranty_days" integer DEFAULT 90,
    "logo_url" "text"
);


--
-- Name: v_current_month_metrics; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."v_current_month_metrics" WITH ("security_invoker"='true') AS
 SELECT "count"(*) FILTER (WHERE ("status" = 'finished'::"public"."order_status")) AS "finished_count",
    COALESCE("sum"(("labor_cost" + "parts_cost_external")) FILTER (WHERE ("status" = 'finished'::"public"."order_status")), (0)::numeric) AS "total_revenue",
    "count"(*) FILTER (WHERE ("status" = 'open'::"public"."order_status")) AS "open_count",
    "count"(*) FILTER (WHERE ("status" = 'analyzing'::"public"."order_status")) AS "analyzing_count"
   FROM "public"."orders"
  WHERE ("date_trunc"('month'::"text", "created_at") = "date_trunc"('month'::"text", (CURRENT_DATE)::timestamp with time zone));


--
-- Name: v_monthly_metrics; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."v_monthly_metrics" WITH ("security_invoker"='true') AS
 SELECT "to_char"("created_at", 'YYYY-MM'::"text") AS "month",
    "count"(*) AS "total_orders",
    "count"(*) FILTER (WHERE ("status" = 'finished'::"public"."order_status")) AS "finished_orders",
    COALESCE("sum"(("labor_cost" + "parts_cost_external")) FILTER (WHERE ("status" = 'finished'::"public"."order_status")), (0)::numeric) AS "revenue"
   FROM "public"."orders"
  GROUP BY ("to_char"("created_at", 'YYYY-MM'::"text"))
  ORDER BY ("to_char"("created_at", 'YYYY-MM'::"text")) DESC
 LIMIT 12;


--
-- Name: v_order_timeline; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."v_order_timeline" WITH ("security_invoker"='true') AS
 SELECT "id",
    "order_id",
    "previous_status",
    "new_status",
    "changed_by",
    "changed_by_type",
    "metadata",
    "created_at",
    ("created_at" AT TIME ZONE 'America/Sao_Paulo'::"text") AS "created_at_br"
   FROM "public"."order_logs"
  ORDER BY "created_at" DESC;


--
-- Name: v_public_store_info; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."v_public_store_info" WITH ("security_barrier"='true', "security_invoker"='true') AS
 SELECT "user_id",
    "trade_name",
    "logo_url",
    "phone",
    "email",
    "address",
    "warranty_days_labor"
   FROM "public"."tenant_settings";


--
-- Name: v_tenant_settings; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."v_tenant_settings" WITH ("security_invoker"='true') AS
 SELECT "id",
    "user_id",
    "trade_name",
    "legal_document",
    "phone",
    "email",
    "address",
    "logo_url",
    "pix_key",
    "pix_key_type",
    "mei_limit_annual",
    "mei_limit_monthly",
    "warranty_days_labor",
    "warranty_days_parts",
    "created_at",
    "updated_at"
   FROM "public"."tenant_settings";


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
)
PARTITION BY RANGE ("inserted_at");


--
-- Name: messages_2026_02_28; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_02_28" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: messages_2026_03_01; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_03_01" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: messages_2026_03_02; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_03_02" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: messages_2026_03_03; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_03_03" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: messages_2026_03_04; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_03_04" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: messages_2026_03_05; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_03_05" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: messages_2026_03_06; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."messages_2026_03_06" (
    "topic" "text" NOT NULL,
    "extension" "text" NOT NULL,
    "payload" "jsonb",
    "event" "text",
    "private" boolean DEFAULT false,
    "updated_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "inserted_at" timestamp without time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."schema_migrations" (
    "version" bigint NOT NULL,
    "inserted_at" timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE "realtime"."subscription" (
    "id" bigint NOT NULL,
    "subscription_id" "uuid" NOT NULL,
    "entity" "regclass" NOT NULL,
    "filters" "realtime"."user_defined_filter"[] DEFAULT '{}'::"realtime"."user_defined_filter"[] NOT NULL,
    "claims" "jsonb" NOT NULL,
    "claims_role" "regrole" GENERATED ALWAYS AS ("realtime"."to_regrole"(("claims" ->> 'role'::"text"))) STORED NOT NULL,
    "created_at" timestamp without time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "action_filter" "text" DEFAULT '*'::"text",
    CONSTRAINT "subscription_action_filter_check" CHECK (("action_filter" = ANY (ARRAY['*'::"text", 'INSERT'::"text", 'UPDATE'::"text", 'DELETE'::"text"])))
);


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE "realtime"."subscription" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "realtime"."subscription_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."buckets" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "owner" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "public" boolean DEFAULT false,
    "avif_autodetection" boolean DEFAULT false,
    "file_size_limit" bigint,
    "allowed_mime_types" "text"[],
    "owner_id" "text",
    "type" "storage"."buckettype" DEFAULT 'STANDARD'::"storage"."buckettype" NOT NULL
);


--
-- Name: COLUMN "buckets"."owner"; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN "storage"."buckets"."owner" IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."buckets_analytics" (
    "name" "text" NOT NULL,
    "type" "storage"."buckettype" DEFAULT 'ANALYTICS'::"storage"."buckettype" NOT NULL,
    "format" "text" DEFAULT 'ICEBERG'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "deleted_at" timestamp with time zone
);


--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."buckets_vectors" (
    "id" "text" NOT NULL,
    "type" "storage"."buckettype" DEFAULT 'VECTOR'::"storage"."buckettype" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."migrations" (
    "id" integer NOT NULL,
    "name" character varying(100) NOT NULL,
    "hash" character varying(40) NOT NULL,
    "executed_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."objects" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "bucket_id" "text",
    "name" "text",
    "owner" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "last_accessed_at" timestamp with time zone DEFAULT "now"(),
    "metadata" "jsonb",
    "path_tokens" "text"[] GENERATED ALWAYS AS ("string_to_array"("name", '/'::"text")) STORED,
    "version" "text",
    "owner_id" "text",
    "user_metadata" "jsonb"
);


--
-- Name: COLUMN "objects"."owner"; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN "storage"."objects"."owner" IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."s3_multipart_uploads" (
    "id" "text" NOT NULL,
    "in_progress_size" bigint DEFAULT 0 NOT NULL,
    "upload_signature" "text" NOT NULL,
    "bucket_id" "text" NOT NULL,
    "key" "text" NOT NULL COLLATE "pg_catalog"."C",
    "version" "text" NOT NULL,
    "owner_id" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "user_metadata" "jsonb"
);


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."s3_multipart_uploads_parts" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "upload_id" "text" NOT NULL,
    "size" bigint DEFAULT 0 NOT NULL,
    "part_number" integer NOT NULL,
    "bucket_id" "text" NOT NULL,
    "key" "text" NOT NULL COLLATE "pg_catalog"."C",
    "etag" "text" NOT NULL,
    "owner_id" "text",
    "version" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE "storage"."vector_indexes" (
    "id" "text" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL COLLATE "pg_catalog"."C",
    "bucket_id" "text" NOT NULL,
    "data_type" "text" NOT NULL,
    "dimension" integer NOT NULL,
    "distance_metric" "text" NOT NULL,
    "metadata_configuration" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: -
--

CREATE TABLE "supabase_functions"."hooks" (
    "id" bigint NOT NULL,
    "hook_table_id" integer NOT NULL,
    "hook_name" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "request_id" bigint
);


--
-- Name: TABLE "hooks"; Type: COMMENT; Schema: supabase_functions; Owner: -
--

COMMENT ON TABLE "supabase_functions"."hooks" IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: -
--

CREATE SEQUENCE "supabase_functions"."hooks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: -
--

ALTER SEQUENCE "supabase_functions"."hooks_id_seq" OWNED BY "supabase_functions"."hooks"."id";


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: -
--

CREATE TABLE "supabase_functions"."migrations" (
    "version" "text" NOT NULL,
    "inserted_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: -
--

CREATE TABLE "supabase_migrations"."schema_migrations" (
    "version" "text" NOT NULL,
    "statements" "text"[],
    "name" "text"
);


--
-- Name: messages_2026_02_28; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_02_28" FOR VALUES FROM ('2026-02-28 00:00:00') TO ('2026-03-01 00:00:00');


--
-- Name: messages_2026_03_01; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_03_01" FOR VALUES FROM ('2026-03-01 00:00:00') TO ('2026-03-02 00:00:00');


--
-- Name: messages_2026_03_02; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_03_02" FOR VALUES FROM ('2026-03-02 00:00:00') TO ('2026-03-03 00:00:00');


--
-- Name: messages_2026_03_03; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_03_03" FOR VALUES FROM ('2026-03-03 00:00:00') TO ('2026-03-04 00:00:00');


--
-- Name: messages_2026_03_04; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_03_04" FOR VALUES FROM ('2026-03-04 00:00:00') TO ('2026-03-05 00:00:00');


--
-- Name: messages_2026_03_05; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_03_05" FOR VALUES FROM ('2026-03-05 00:00:00') TO ('2026-03-06 00:00:00');


--
-- Name: messages_2026_03_06; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages" ATTACH PARTITION "realtime"."messages_2026_03_06" FOR VALUES FROM ('2026-03-06 00:00:00') TO ('2026-03-07 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."refresh_tokens" ALTER COLUMN "id" SET DEFAULT "nextval"('"auth"."refresh_tokens_id_seq"'::"regclass");


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY "supabase_functions"."hooks" ALTER COLUMN "id" SET DEFAULT "nextval"('"supabase_functions"."hooks_id_seq"'::"regclass");


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at", "invite_token", "referrer", "oauth_client_state_id", "linking_target_id", "email_optional") FROM stdin;
bc6fef71-09e4-4e8e-9e59-f0a8abd4cf22	8132d666-06c0-46a7-b362-a30393be96c0	2d3d5153-3649-4524-9503-3afc6fc6539d	s256	6yC1bOLXJAFp7jrnfTbbnCIYmwbzbbx9Sq3ehVb1u18	email			2026-01-29 02:13:33.440022+00	2026-01-29 02:14:38.214921+00	email/signup	2026-01-29 02:14:38.214877+00	\N	\N	\N	\N	f
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
f0d4c34e-b761-4565-a91e-316c736e9f04	f0d4c34e-b761-4565-a91e-316c736e9f04	{"sub": "f0d4c34e-b761-4565-a91e-316c736e9f04", "email": "admin@wtech.com", "email_verified": false, "phone_verified": false}	email	2026-01-25 21:18:06.662468+00	2026-01-25 21:18:06.662533+00	2026-01-25 21:18:06.662533+00	537bcd84-d5e5-42b9-86f1-1c48da4156ea
8132d666-06c0-46a7-b362-a30393be96c0	8132d666-06c0-46a7-b362-a30393be96c0	{"sub": "8132d666-06c0-46a7-b362-a30393be96c0", "email": "wtechinformatica02@gmail.com", "full_name": "Wheslan", "email_verified": true, "phone_verified": false}	email	2026-01-29 02:13:33.430539+00	2026-01-29 02:13:33.430603+00	2026-01-29 02:13:33.430603+00	2752688d-1ba1-4f85-920e-7e55cf27ab06
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
d814f65f-5c72-4074-b155-a819b0282bed	2026-01-25 21:21:34.149911+00	2026-01-25 21:21:34.149911+00	password	e94eec57-236f-4b42-a9d2-f43fb8727ad8
2d2af427-2d89-468a-8391-5cc5af5cef8b	2026-01-27 02:22:52.061451+00	2026-01-27 02:22:52.061451+00	password	8a86151f-1de4-4e56-adc1-d703941887e8
eeff298e-bc5b-491f-82d3-bd9c39a274bd	2026-01-27 02:45:56.711043+00	2026-01-27 02:45:56.711043+00	password	b3d56722-1fcb-4fe6-b7ea-3819dc73be26
ecad5e77-dc89-4fa8-8d96-bce5eaacefbe	2026-01-27 03:21:54.513819+00	2026-01-27 03:21:54.513819+00	password	a9e39656-43c8-4741-9038-d103f49c5de5
c92b876b-37bb-4a60-a921-143ea9d26ae3	2026-01-29 02:14:44.493333+00	2026-01-29 02:14:44.493333+00	password	ca5453db-38cb-448f-bc95-18a361141337
56b27e3f-a3c4-4889-89f3-fd455d98ce20	2026-01-29 02:50:00.554518+00	2026-01-29 02:50:00.554518+00	password	b2a877ea-3a11-4ebc-a963-959ec1a2a5b5
ed3bf0ff-976c-4556-8b02-444836460859	2026-01-29 14:01:27.605366+00	2026-01-29 14:01:27.605366+00	password	4b019e5f-c74f-447f-ae91-613fb3e70069
42e31f83-1f38-4fa5-806d-9939d1fdc3d9	2026-01-29 22:59:16.812106+00	2026-01-29 22:59:16.812106+00	password	ef0e6400-05b3-4e64-8781-50c86fed0271
93bf1daa-e3e5-4aea-bdbe-86071571be0f	2026-01-31 22:21:02.400032+00	2026-01-31 22:21:02.400032+00	password	0d772fa8-0e29-4806-8cab-4d144b3e3447
1290ede9-194b-44bb-b0cb-26de00bfda07	2026-02-01 21:01:28.587792+00	2026-02-01 21:01:28.587792+00	password	ac027e6c-8984-43f4-a631-be66e334d247
df6a8c79-4591-405d-8a51-0493250c612b	2026-02-03 00:24:04.461564+00	2026-02-03 00:24:04.461564+00	password	680292bc-ea32-491e-8dd6-ee2859d2a082
dcd897e6-b892-4606-9486-3efb34003ba8	2026-02-03 22:20:58.690545+00	2026-02-03 22:20:58.690545+00	password	71149e8d-dfde-4991-94f0-8d0045bef198
669ff5ff-39ca-4b2f-ae37-150c7b154712	2026-02-04 13:55:54.966384+00	2026-02-04 13:55:54.966384+00	password	97393ac8-3ee5-4308-b593-7d5ebb08172c
b3fcc254-f846-4073-bb13-bf3cd84c4a40	2026-02-11 01:03:06.599854+00	2026-02-11 01:03:06.599854+00	password	65baca64-05de-4b58-b996-b32dca78b549
0d18e084-f4ce-4a59-a895-d7cb0da6a6d1	2026-02-12 23:56:41.218007+00	2026-02-12 23:56:41.218007+00	password	e7bb39f8-5eca-484f-b656-5fc1c5dd0b67
6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc	2026-02-19 00:47:57.029204+00	2026-02-19 00:47:57.029204+00	password	dfc72325-e47d-4852-a633-c78eecafad0a
0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c	2026-02-19 01:10:34.85745+00	2026-02-19 01:10:34.85745+00	password	0f556b3d-09c9-4a27-b41b-3efcc7cd4de5
d58bad3e-9392-4a12-a993-6fc4e6954aba	2026-02-19 22:33:41.313029+00	2026-02-19 22:33:41.313029+00	password	80443836-ae7e-454d-ac32-03ededfae329
451126f1-871d-46e4-bca0-2d991e8af084	2026-02-20 19:37:03.318029+00	2026-02-20 19:37:03.318029+00	password	685a7b3f-0165-4e69-9f2c-e5eaf17a1c06
576b374f-80a7-4262-9266-63d2e054e880	2026-02-20 22:12:37.100145+00	2026-02-20 22:12:37.100145+00	password	52ba37e0-ec69-4053-a4bf-855e61fd7f9c
5c58f89c-f050-4127-8de5-3d2e65c2ad05	2026-02-21 05:04:41.147338+00	2026-02-21 05:04:41.147338+00	password	8a454d2d-af1d-4f8e-b344-af7710fad958
af174363-57df-454b-b1b2-6cfaa7428929	2026-02-21 17:00:09.255863+00	2026-02-21 17:00:09.255863+00	password	5dea01ec-a145-4d7e-8781-02609588127d
6f774b8d-5087-43d8-a088-6bf2ddb20fe4	2026-02-25 00:13:58.402416+00	2026-02-25 00:13:58.402416+00	password	d70e76f5-c263-4718-8dea-a7b421040db4
b590cbc0-f140-48be-a2fe-d5635a844655	2026-02-26 12:57:47.369809+00	2026-02-26 12:57:47.369809+00	password	85d0a70a-f7e6-45b7-9fc9-e2c4ce8f628b
d7c6c5c6-5762-4f30-a5e7-bae958bbeeec	2026-03-01 02:07:53.942738+00	2026-03-01 02:07:53.942738+00	password	d24d2df6-f42c-4449-bbf3-e378b9211163
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid", "last_webauthn_challenge_data") FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."oauth_authorizations" ("id", "authorization_id", "client_id", "user_id", "redirect_uri", "scope", "state", "resource", "code_challenge", "code_challenge_method", "response_type", "status", "authorization_code", "created_at", "expires_at", "approved_at", "nonce") FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."oauth_client_states" ("id", "provider_type", "code_verifier", "created_at") FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."oauth_clients" ("id", "client_secret_hash", "registration_type", "redirect_uris", "grant_types", "client_name", "client_uri", "logo_uri", "created_at", "updated_at", "deleted_at", "client_type", "token_endpoint_auth_method") FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."oauth_consents" ("id", "user_id", "client_id", "scopes", "granted_at", "revoked_at") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
00000000-0000-0000-0000-000000000000	1	yn32vur3ehfe	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-25 21:21:34.141474+00	2026-01-25 22:22:06.781198+00	\N	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	2	y5lrjwkxpwvh	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-25 22:22:06.801874+00	2026-01-26 19:19:41.233683+00	yn32vur3ehfe	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	3	6touknhbjgy2	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-26 19:19:41.253676+00	2026-01-26 20:18:21.53472+00	y5lrjwkxpwvh	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	4	vijsagzcg4vw	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-26 20:18:21.543904+00	2026-01-26 21:16:50.364564+00	6touknhbjgy2	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	5	an3ws7d7e42f	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-26 21:16:50.377174+00	2026-01-26 23:50:55.555585+00	vijsagzcg4vw	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	6	fidcele42n55	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-26 23:50:55.580777+00	2026-01-27 00:52:22.471205+00	an3ws7d7e42f	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	7	ztaliltgpssa	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 00:52:22.482171+00	2026-01-27 01:50:55.483001+00	fidcele42n55	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	8	fzlrasmhm2pa	f0d4c34e-b761-4565-a91e-316c736e9f04	f	2026-01-27 01:50:55.49736+00	2026-01-27 01:50:55.49736+00	ztaliltgpssa	d814f65f-5c72-4074-b155-a819b0282bed
00000000-0000-0000-0000-000000000000	9	u2orinpcdl24	f0d4c34e-b761-4565-a91e-316c736e9f04	f	2026-01-27 02:22:52.031789+00	2026-01-27 02:22:52.031789+00	\N	2d2af427-2d89-468a-8391-5cc5af5cef8b
00000000-0000-0000-0000-000000000000	10	7t5sbqxvbht3	f0d4c34e-b761-4565-a91e-316c736e9f04	f	2026-01-27 02:45:56.696504+00	2026-01-27 02:45:56.696504+00	\N	eeff298e-bc5b-491f-82d3-bd9c39a274bd
00000000-0000-0000-0000-000000000000	11	ebkbufbqt2nm	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 03:21:54.435491+00	2026-01-27 13:05:58.939562+00	\N	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	12	5jedpgqzymlk	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 13:05:58.956583+00	2026-01-27 14:04:27.071515+00	ebkbufbqt2nm	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	13	vupdkgbg6kym	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 14:04:27.114385+00	2026-01-27 15:08:13.025401+00	5jedpgqzymlk	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	14	bo3hzhsxlscl	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 15:08:13.061068+00	2026-01-27 16:06:57.168723+00	vupdkgbg6kym	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	15	la6hdugmrt3w	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 16:06:57.178544+00	2026-01-27 19:44:18.002257+00	bo3hzhsxlscl	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	16	jwyt733tgyig	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 19:44:18.035059+00	2026-01-27 21:16:43.570128+00	la6hdugmrt3w	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	17	ongjpcahzb5s	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-27 21:16:43.601384+00	2026-01-28 12:35:45.684192+00	jwyt733tgyig	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	18	msqxg6tuvd6n	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 12:35:45.707606+00	2026-01-28 13:36:14.320794+00	ongjpcahzb5s	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	19	t7fuy5q4674e	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 13:36:14.34395+00	2026-01-28 14:35:07.90148+00	msqxg6tuvd6n	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	20	4lm76fgg46ux	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 14:35:07.940341+00	2026-01-28 17:58:22.241899+00	t7fuy5q4674e	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	21	kdlkp5o6ikad	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 17:58:22.270238+00	2026-01-28 18:57:08.058195+00	4lm76fgg46ux	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	22	h35kjlra2bpp	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 18:57:08.08813+00	2026-01-28 19:56:08.129759+00	kdlkp5o6ikad	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	23	qmatl3zqwsxk	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 19:56:08.163575+00	2026-01-28 20:55:08.431668+00	h35kjlra2bpp	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	24	h3orwhrvljzt	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 20:55:08.466248+00	2026-01-28 23:14:06.12972+00	qmatl3zqwsxk	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	25	4mttdpgk3krb	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-28 23:14:06.149601+00	2026-01-29 00:13:15.783042+00	h3orwhrvljzt	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	26	g5lsheueadvk	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-29 00:13:15.807428+00	2026-01-29 01:11:48.481703+00	4mttdpgk3krb	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	27	kvavdeimh3qf	f0d4c34e-b761-4565-a91e-316c736e9f04	t	2026-01-29 01:11:48.493757+00	2026-01-29 02:11:12.971727+00	g5lsheueadvk	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	28	synzywdc2kac	f0d4c34e-b761-4565-a91e-316c736e9f04	f	2026-01-29 02:11:13.009265+00	2026-01-29 02:11:13.009265+00	kvavdeimh3qf	ecad5e77-dc89-4fa8-8d96-bce5eaacefbe
00000000-0000-0000-0000-000000000000	31	w23wji2773ns	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 14:01:27.572598+00	2026-01-29 15:01:25.864668+00	\N	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	32	tkzwjscmdmtg	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 15:01:25.883653+00	2026-01-29 16:18:59.763665+00	w23wji2773ns	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	33	g7l6d4jcvjnm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 16:18:59.769484+00	2026-01-29 18:23:05.127681+00	tkzwjscmdmtg	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	29	gufdtjgzzwsl	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 02:14:44.477855+00	2026-01-29 19:30:25.411005+00	\N	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	30	bunaomdf2blq	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 02:50:00.49836+00	2026-01-29 19:53:34.549852+00	\N	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	34	b4va4aq6g7tu	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 18:23:05.163344+00	2026-01-29 20:02:37.701077+00	g7l6d4jcvjnm	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	35	2qxp7btls5ki	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 19:30:25.436314+00	2026-01-29 20:29:26.500435+00	gufdtjgzzwsl	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	37	7qvxjs3seg75	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 20:02:37.707549+00	2026-01-29 23:25:21.281009+00	b4va4aq6g7tu	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	39	seww7biw65pq	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 22:59:16.798018+00	2026-01-29 23:57:42.452594+00	\N	42e31f83-1f38-4fa5-806d-9939d1fdc3d9
00000000-0000-0000-0000-000000000000	41	ntnfaavmo4fa	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 23:57:42.47229+00	2026-01-30 00:56:42.829541+00	seww7biw65pq	42e31f83-1f38-4fa5-806d-9939d1fdc3d9
00000000-0000-0000-0000-000000000000	42	5xhpmiywzyhb	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-01-30 00:56:42.860086+00	2026-01-30 00:56:42.860086+00	ntnfaavmo4fa	42e31f83-1f38-4fa5-806d-9939d1fdc3d9
00000000-0000-0000-0000-000000000000	36	zl5rnrkihqsb	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 19:53:34.597371+00	2026-01-30 01:44:52.599556+00	bunaomdf2blq	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	40	vmxraoofkb7v	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 23:25:21.308994+00	2026-01-30 01:54:23.973219+00	7qvxjs3seg75	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	38	5p44z5fiey7t	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-29 20:29:26.520554+00	2026-01-30 01:57:05.598498+00	2qxp7btls5ki	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	43	qljhvatvx3av	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 01:44:52.634096+00	2026-01-30 02:47:03.676914+00	zl5rnrkihqsb	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	46	tftwfohlhf4b	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 02:47:03.698379+00	2026-01-30 03:46:25.861361+00	qljhvatvx3av	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	44	faunjr7zl5jd	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 01:54:23.977464+00	2026-01-30 03:51:52.837454+00	vmxraoofkb7v	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	48	4kfp7go3f4zk	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 03:51:52.857535+00	2026-01-30 05:10:12.818734+00	faunjr7zl5jd	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	45	ptijbydomgsf	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 01:57:05.599367+00	2026-01-30 13:25:43.475748+00	5p44z5fiey7t	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	47	qb5f3ul2ndip	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 03:46:25.898903+00	2026-01-30 13:26:54.775856+00	tftwfohlhf4b	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	49	djdn73niqdhu	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 05:10:12.836433+00	2026-01-30 13:35:07.580872+00	4kfp7go3f4zk	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	50	vsqw6r3dyqwq	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 13:25:43.507808+00	2026-01-30 14:27:56.690656+00	ptijbydomgsf	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	71	knlgfxfi2lqy	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-31 23:24:59.518835+00	2026-02-01 00:31:48.810946+00	v3oawe5x4sez	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	72	ej33gohp6ogt	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-01 00:31:48.831924+00	2026-02-01 01:42:16.965133+00	knlgfxfi2lqy	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	53	7m4gvdurrqx4	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 14:27:56.715772+00	2026-01-30 15:27:39.843597+00	vsqw6r3dyqwq	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	73	clp35ekfetir	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-01 01:42:16.980693+00	2026-02-01 03:58:12.087861+00	ej33gohp6ogt	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	51	d4e4furtnn24	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 13:26:54.776262+00	2026-01-30 16:24:54.751629+00	qb5f3ul2ndip	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	54	k4ozhbazfasm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 15:27:39.88063+00	2026-01-30 16:26:17.371515+00	7m4gvdurrqx4	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	52	adxlzjrn44dj	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 13:35:07.599942+00	2026-01-30 16:26:32.185474+00	djdn73niqdhu	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	55	wmjlc7c54bva	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 16:24:54.783779+00	2026-01-30 17:27:14.433272+00	d4e4furtnn24	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	75	6pmbre5xjkjp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-01 21:01:28.538498+00	2026-02-01 22:00:14.9409+00	\N	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	57	ire6w2p2jvzk	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 16:26:32.186471+00	2026-01-30 17:48:58.926464+00	adxlzjrn44dj	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	58	oo3m5t56lc2q	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 17:27:14.458714+00	2026-01-30 18:29:47.333292+00	wmjlc7c54bva	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	76	i4z3hifqx3ou	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-01 22:00:14.967477+00	2026-02-01 22:59:15.011573+00	6pmbre5xjkjp	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	59	rmlll5flfxy5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 17:48:58.943781+00	2026-01-30 19:29:54.129701+00	ire6w2p2jvzk	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	60	kivnx724vhaz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 18:29:47.343173+00	2026-01-30 19:30:56.135778+00	oo3m5t56lc2q	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	77	4hnvcsr4illq	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-01 22:59:15.042359+00	2026-02-02 00:02:32.974201+00	i4z3hifqx3ou	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	62	2wkykwhpblrw	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 19:30:56.138222+00	2026-01-30 20:31:35.488183+00	kivnx724vhaz	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	61	sdau65dkyitc	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 19:29:54.142455+00	2026-01-30 22:33:07.059852+00	rmlll5flfxy5	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	78	6zbitxqhepqz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 00:02:33.00166+00	2026-02-02 01:00:41.526062+00	4hnvcsr4illq	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	63	dgg32mekkfme	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 20:31:35.518785+00	2026-01-31 01:15:47.21517+00	2wkykwhpblrw	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	65	fcrl4z5uehla	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-31 01:15:47.242125+00	2026-01-31 02:14:22.248965+00	dgg32mekkfme	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	79	pkirhmuhqcbh	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 01:00:41.538974+00	2026-02-02 01:59:25.138319+00	6zbitxqhepqz	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	66	ioe4mkxsy6hp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-31 02:14:22.270965+00	2026-01-31 03:25:53.293528+00	fcrl4z5uehla	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	67	njtkyn65kuca	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-01-31 03:25:53.32352+00	2026-01-31 03:25:53.32352+00	ioe4mkxsy6hp	56b27e3f-a3c4-4889-89f3-fd455d98ce20
00000000-0000-0000-0000-000000000000	64	g4hnpgadxr2l	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 22:33:07.086984+00	2026-01-31 14:57:13.76944+00	sdau65dkyitc	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	68	2cfymfvr6o5g	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-31 14:57:13.801927+00	2026-01-31 20:21:02.908697+00	g4hnpgadxr2l	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	80	otvayokggogf	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 01:59:25.152977+00	2026-02-02 02:58:04.389311+00	pkirhmuhqcbh	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	70	v3oawe5x4sez	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-31 22:21:02.366178+00	2026-01-31 23:24:59.491464+00	\N	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	81	lgl5pradvso5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 02:58:04.414005+00	2026-02-02 03:56:07.836739+00	otvayokggogf	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	82	7wkfw5qdchaf	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 03:56:07.865543+00	2026-02-02 11:43:30.07694+00	lgl5pradvso5	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	83	fq4e7eg36z2q	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 11:43:30.099205+00	2026-02-02 12:42:16.179668+00	7wkfw5qdchaf	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	84	crwy6ml63mgs	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 12:42:16.195711+00	2026-02-02 13:40:55.364332+00	fq4e7eg36z2q	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	85	g3qm237xajtn	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 13:40:55.373616+00	2026-02-02 14:39:27.953658+00	crwy6ml63mgs	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	86	cxb5oau3fpp3	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 14:39:27.963822+00	2026-02-02 15:41:22.849992+00	g3qm237xajtn	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	87	zbg7ezwwdpel	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 15:41:22.874919+00	2026-02-02 16:40:04.716092+00	cxb5oau3fpp3	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	88	5cm277ds7yfb	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 16:40:04.731201+00	2026-02-02 17:39:05.04478+00	zbg7ezwwdpel	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	89	g7eadartehpo	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 17:39:05.070385+00	2026-02-02 18:37:27.051631+00	5cm277ds7yfb	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	90	vi5szxfnmghs	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 18:37:27.064795+00	2026-02-02 19:36:05.787148+00	g7eadartehpo	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	91	lde4fx4p3zui	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 19:36:05.811905+00	2026-02-02 20:34:56.212817+00	vi5szxfnmghs	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	92	t2c77dhwgd34	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 20:34:56.22249+00	2026-02-02 22:08:08.031868+00	lde4fx4p3zui	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	69	3b64pcqnlaoq	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-31 20:21:02.945823+00	2026-02-02 22:33:44.215784+00	2cfymfvr6o5g	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	93	bnith2fck5x7	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 22:08:08.058922+00	2026-02-02 23:06:46.373359+00	t2c77dhwgd34	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	95	rfkkiliycazm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 23:06:46.387119+00	2026-02-03 00:06:11.748632+00	bnith2fck5x7	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	97	eqg4zzf2k7ma	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-03 00:24:04.416916+00	2026-02-03 00:24:04.416916+00	\N	df6a8c79-4591-405d-8a51-0493250c612b
00000000-0000-0000-0000-000000000000	96	uhxsdgb2tlk5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 00:06:11.771508+00	2026-02-03 01:36:28.04515+00	rfkkiliycazm	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	74	lrfay2z4ps5f	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-01 03:58:12.107444+00	2026-02-03 01:36:38.115581+00	clp35ekfetir	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	98	pffajftk35ox	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 01:36:28.071628+00	2026-02-03 02:35:27.899751+00	uhxsdgb2tlk5	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	99	pv456443l3oo	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 01:36:38.116026+00	2026-02-03 02:35:29.436519+00	lrfay2z4ps5f	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	100	ylcjfhmlgb22	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 02:35:27.912562+00	2026-02-03 22:22:20.141473+00	pffajftk35ox	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	94	omhcmfjqb7cs	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-02 22:33:44.229041+00	2026-02-04 19:44:01.887155+00	3b64pcqnlaoq	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	56	kyzs5wyzoeyr	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-01-30 16:26:17.379002+00	2026-02-06 01:44:45.247914+00	k4ozhbazfasm	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	166	uex3orxnaqnz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 19:14:49.522129+00	2026-02-21 20:13:37.93952+00	wnbzoeq7x7fw	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	101	l3z5dw2c7fvk	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 02:35:29.437377+00	2026-02-03 15:28:00.898177+00	pv456443l3oo	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	142	r5grlnblni7p	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 00:52:46.859026+00	2026-02-24 22:15:00.685542+00	jabkrwjyqdvn	d58bad3e-9392-4a12-a993-6fc4e6954aba
00000000-0000-0000-0000-000000000000	102	4x2zhn3o75xx	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 15:28:00.92552+00	2026-02-03 20:27:00.880532+00	l3z5dw2c7fvk	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	105	ufjesyqorimm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 22:22:20.167645+00	2026-02-03 23:29:25.767103+00	ylcjfhmlgb22	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	104	zp6xzj5co3o4	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 22:20:58.644325+00	2026-02-03 23:47:45.562954+00	\N	dcd897e6-b892-4606-9486-3efb34003ba8
00000000-0000-0000-0000-000000000000	107	hbpcjqzhlpw6	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-03 23:47:45.573359+00	2026-02-03 23:47:45.573359+00	zp6xzj5co3o4	dcd897e6-b892-4606-9486-3efb34003ba8
00000000-0000-0000-0000-000000000000	103	4fwxy2q6zbx3	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 20:27:00.911163+00	2026-02-04 01:06:20.182352+00	4x2zhn3o75xx	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	108	feyk2s6rwhqd	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-04 01:06:20.210801+00	2026-02-04 02:24:28.685358+00	4fwxy2q6zbx3	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	109	ecobza5li4xa	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-04 02:24:28.719935+00	2026-02-04 02:24:28.719935+00	feyk2s6rwhqd	93bf1daa-e3e5-4aea-bdbe-86071571be0f
00000000-0000-0000-0000-000000000000	110	xljo2m3tenh3	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-04 13:55:54.924768+00	2026-02-04 13:55:54.924768+00	\N	669ff5ff-39ca-4b2f-ae37-150c7b154712
00000000-0000-0000-0000-000000000000	106	e72ehx2vg4k6	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-03 23:29:25.800533+00	2026-02-04 16:03:22.836466+00	ufjesyqorimm	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	111	q2dkc2rbzpmg	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-04 16:03:22.844728+00	2026-02-04 19:04:36.951879+00	e72ehx2vg4k6	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	112	gctrjlhz5z2a	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-04 19:04:36.97862+00	2026-02-05 13:10:19.382463+00	q2dkc2rbzpmg	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	113	ifjybbxqn5zv	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-04 19:44:01.913398+00	2026-02-05 14:38:48.303007+00	omhcmfjqb7cs	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	115	ubui6untc3kj	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-05 14:38:48.321071+00	2026-02-05 14:38:48.321071+00	ifjybbxqn5zv	ed3bf0ff-976c-4556-8b02-444836460859
00000000-0000-0000-0000-000000000000	114	h6okxqqfe2xu	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-05 13:10:19.410748+00	2026-02-05 18:35:17.646703+00	gctrjlhz5z2a	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	116	ltcobmhs2q6v	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-05 18:35:17.680595+00	2026-02-05 19:37:57.483213+00	h6okxqqfe2xu	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	117	ywgmvc3z4vth	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-05 19:37:57.496215+00	2026-02-05 20:50:33.542307+00	ltcobmhs2q6v	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	118	vlqqza735t3k	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-05 20:50:33.576737+00	2026-02-05 20:50:33.576737+00	ywgmvc3z4vth	1290ede9-194b-44bb-b0cb-26de00bfda07
00000000-0000-0000-0000-000000000000	119	zybodtzkbnwd	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-06 01:44:45.281353+00	2026-02-06 01:44:45.281353+00	kyzs5wyzoeyr	c92b876b-37bb-4a60-a921-143ea9d26ae3
00000000-0000-0000-0000-000000000000	120	vs7a3tnbfoaj	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-11 01:03:06.552469+00	2026-02-11 01:03:06.552469+00	\N	b3fcc254-f846-4073-bb13-bf3cd84c4a40
00000000-0000-0000-0000-000000000000	121	sqc4vqbglrvr	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-12 23:56:41.170611+00	2026-02-13 23:10:45.900808+00	\N	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	124	rfibcsn7x6nx	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 01:10:34.840362+00	2026-02-19 02:09:11.575346+00	\N	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	125	c3b3wwahh6rs	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 02:09:11.594983+00	2026-02-19 03:07:50.683753+00	rfibcsn7x6nx	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	123	hac33qinri2c	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 00:47:56.99183+00	2026-02-19 03:22:17.191024+00	\N	6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc
00000000-0000-0000-0000-000000000000	126	yrr4uu6j3wh4	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 03:07:50.698249+00	2026-02-19 13:00:16.984595+00	c3b3wwahh6rs	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	128	zi3tlhw57q7c	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 13:00:17.012221+00	2026-02-19 13:58:24.080489+00	yrr4uu6j3wh4	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	127	l73hk7sdhhhi	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 03:22:17.194939+00	2026-02-19 14:48:52.997622+00	hac33qinri2c	6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc
00000000-0000-0000-0000-000000000000	129	52khh4wyj5oe	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 13:58:24.100979+00	2026-02-19 14:56:54.480792+00	zi3tlhw57q7c	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	130	usanufw3be3o	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 14:48:53.01706+00	2026-02-19 15:47:32.348391+00	l73hk7sdhhhi	6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc
00000000-0000-0000-0000-000000000000	131	5utenr6hfabt	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 14:56:54.489948+00	2026-02-19 15:55:19.247336+00	52khh4wyj5oe	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	132	sw6gcw7bnzk5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 15:47:32.355871+00	2026-02-19 16:48:43.099566+00	usanufw3be3o	6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc
00000000-0000-0000-0000-000000000000	133	el5vntum5m7a	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 15:55:19.248329+00	2026-02-19 16:53:49.357734+00	5utenr6hfabt	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	135	bwrsmrlgygob	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 16:53:49.359558+00	2026-02-19 17:52:19.433515+00	el5vntum5m7a	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	136	cxfkmcbe34ab	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 17:52:19.437019+00	2026-02-19 18:51:45.204926+00	bwrsmrlgygob	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	137	oagykqqruijp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 18:51:45.216026+00	2026-02-19 19:50:52.331831+00	cxfkmcbe34ab	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	139	n4xi7yjyl7cu	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 22:33:41.304163+00	2026-02-19 23:32:14.824532+00	\N	d58bad3e-9392-4a12-a993-6fc4e6954aba
00000000-0000-0000-0000-000000000000	122	rfpgruteosnt	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-13 23:10:45.932888+00	2026-02-19 23:57:15.196162+00	sqc4vqbglrvr	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	140	jabkrwjyqdvn	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 23:32:14.840416+00	2026-02-20 00:52:46.845938+00	n4xi7yjyl7cu	d58bad3e-9392-4a12-a993-6fc4e6954aba
00000000-0000-0000-0000-000000000000	134	ehzcau3554cc	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 16:48:43.10043+00	2026-02-20 02:17:11.226195+00	sw6gcw7bnzk5	6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc
00000000-0000-0000-0000-000000000000	143	432xhfgtdqin	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-20 02:17:11.248591+00	2026-02-20 02:17:11.248591+00	ehzcau3554cc	6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc
00000000-0000-0000-0000-000000000000	138	qk73iitj6d33	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 19:50:52.340543+00	2026-02-20 19:42:17.64169+00	oagykqqruijp	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	144	zmkqqdlosxgr	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 19:37:03.299689+00	2026-02-20 20:37:51.934298+00	\N	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	145	okdwiszvjdy6	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 19:42:17.662095+00	2026-02-20 20:44:37.559495+00	qk73iitj6d33	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	147	hian53gd4c2v	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 20:44:37.560441+00	2026-02-20 22:02:52.697628+00	okdwiszvjdy6	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	149	2msn7klgrurj	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-20 22:12:37.097372+00	2026-02-20 22:12:37.097372+00	\N	576b374f-80a7-4262-9266-63d2e054e880
00000000-0000-0000-0000-000000000000	148	ddcjunwr23cx	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 22:02:52.699194+00	2026-02-20 23:48:33.481638+00	hian53gd4c2v	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	146	4xd6tz6yhxjz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 20:37:51.948429+00	2026-02-21 00:32:57.900364+00	zmkqqdlosxgr	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	150	rill2e6sfcmw	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-20 23:48:33.497342+00	2026-02-21 00:47:15.897075+00	ddcjunwr23cx	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	163	wnbzoeq7x7fw	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 17:20:14.576544+00	2026-02-21 19:14:49.520809+00	2ydpmtdokbhz	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	159	5w6xf67hka3t	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 14:44:59.203807+00	2026-02-21 20:04:50.298142+00	cgzup7lgk5o3	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	151	us4vlqdb4fcb	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 00:32:57.9101+00	2026-02-21 01:31:53.477748+00	4xd6tz6yhxjz	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	152	fbfcldkibajq	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 00:47:15.903054+00	2026-02-21 01:45:49.126793+00	rill2e6sfcmw	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	153	uljqdct44br3	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 01:31:53.488738+00	2026-02-21 04:09:59.56349+00	us4vlqdb4fcb	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	168	vwltkqlros3c	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 20:13:37.95758+00	2026-02-21 21:12:38.123522+00	uex3orxnaqnz	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	155	ajseinh3i7lo	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 04:09:59.570072+00	2026-02-21 12:16:29.458427+00	uljqdct44br3	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	154	3jdctjenb5xt	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 01:45:49.130358+00	2026-02-21 21:34:17.117907+00	fbfcldkibajq	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	157	abjwyofalgsx	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 12:16:29.479729+00	2026-02-21 14:13:24.868203+00	ajseinh3i7lo	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	156	cgzup7lgk5o3	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 05:04:41.144883+00	2026-02-21 14:44:59.202553+00	\N	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	158	xbuu5icvrytm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 14:13:24.880107+00	2026-02-21 15:22:34.829022+00	abjwyofalgsx	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	167	mxp2ddvmkbpz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 20:04:50.308176+00	2026-02-21 21:48:36.61185+00	5w6xf67hka3t	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	160	fr7ppkia5ip5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 15:22:34.83516+00	2026-02-21 16:21:37.884005+00	xbuu5icvrytm	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	169	z3ksyxrfsp5o	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 21:12:38.125225+00	2026-02-21 22:33:33.34823+00	vwltkqlros3c	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	161	2ydpmtdokbhz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 16:21:37.886366+00	2026-02-21 17:20:14.570741+00	fr7ppkia5ip5	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	162	6s3hl6ljwjud	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 17:00:09.253169+00	2026-02-21 17:58:23.244162+00	\N	af174363-57df-454b-b1b2-6cfaa7428929
00000000-0000-0000-0000-000000000000	164	obbh4tkbxt5z	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 17:58:23.245916+00	2026-02-21 19:02:52.674782+00	6s3hl6ljwjud	af174363-57df-454b-b1b2-6cfaa7428929
00000000-0000-0000-0000-000000000000	165	uydzyiv45juh	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-21 19:02:52.675727+00	2026-02-21 19:02:52.675727+00	obbh4tkbxt5z	af174363-57df-454b-b1b2-6cfaa7428929
00000000-0000-0000-0000-000000000000	172	inda4latlpfh	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 22:33:33.349146+00	2026-02-22 02:19:56.556546+00	z3ksyxrfsp5o	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	171	ovtyefnltqoz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 21:48:36.626747+00	2026-02-22 04:10:27.194703+00	mxp2ddvmkbpz	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	170	l4p3tlgtgcuc	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-21 21:34:17.118821+00	2026-02-22 15:31:36.724073+00	3jdctjenb5xt	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	175	yeyr2cuk6ocf	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 15:31:36.748146+00	2026-02-22 16:30:58.484735+00	l4p3tlgtgcuc	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	173	dxkhne2idij2	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 02:19:56.562951+00	2026-02-22 16:46:37.678039+00	inda4latlpfh	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	176	huizc6onbbl7	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 16:30:58.499373+00	2026-02-22 17:29:58.637482+00	yeyr2cuk6ocf	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	178	qdcdvzfamsi6	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 17:29:58.650669+00	2026-02-22 19:08:40.489633+00	huizc6onbbl7	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	179	75oct7cd7443	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 19:08:40.503588+00	2026-02-22 20:07:49.99146+00	qdcdvzfamsi6	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	180	p3i7fm3dzm3z	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 20:07:50.024359+00	2026-02-22 21:06:25.113456+00	75oct7cd7443	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	181	f3nmxjt3k5hl	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 21:06:25.127823+00	2026-02-22 22:05:19.280621+00	p3i7fm3dzm3z	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	182	7phi4hseczuo	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 22:05:19.288317+00	2026-02-22 23:03:58.837513+00	f3nmxjt3k5hl	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	183	or6hevyqyyar	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 23:03:58.843514+00	2026-02-23 00:02:37.459803+00	7phi4hseczuo	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	184	m7quuymj7gft	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 00:02:37.471104+00	2026-02-23 01:01:04.460883+00	or6hevyqyyar	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	185	qczb64qu3lkc	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 01:01:04.477354+00	2026-02-23 01:59:17.485652+00	m7quuymj7gft	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	186	wdgw7mun4vdd	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 01:59:17.491535+00	2026-02-23 03:01:31.011774+00	qczb64qu3lkc	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	174	fc63drxxzij2	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 04:10:27.195905+00	2026-02-23 12:29:21.745715+00	ovtyefnltqoz	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	187	c3sca4fi7dvp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 03:01:31.02662+00	2026-02-23 13:01:52.917146+00	wdgw7mun4vdd	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	189	lzm4fs43i7fp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 13:01:52.926248+00	2026-02-23 14:04:05.788406+00	c3sca4fi7dvp	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	188	o5n3ng2cm4w4	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 12:29:21.78463+00	2026-02-23 14:36:28.258066+00	fc63drxxzij2	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	190	mm2po5xyz7bj	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 14:04:05.789894+00	2026-02-23 15:02:18.629736+00	lzm4fs43i7fp	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	191	ppdurdicq2h3	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 14:36:28.269775+00	2026-02-23 18:05:44.431198+00	o5n3ng2cm4w4	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	193	2qjhzlbzpfve	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 18:05:44.458575+00	2026-02-24 01:04:14.462026+00	ppdurdicq2h3	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	194	f4w5b63umfkh	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 01:04:14.483462+00	2026-02-24 03:28:01.005074+00	2qjhzlbzpfve	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	177	j3uqhe64yic5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-22 16:46:37.680577+00	2026-02-24 18:02:28.368319+00	dxkhne2idij2	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	196	mxonon63anoe	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 18:02:28.396658+00	2026-02-24 19:55:09.755068+00	j3uqhe64yic5	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	192	d75eoqxmls2f	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-23 15:02:18.636027+00	2026-02-24 20:45:45.307422+00	mm2po5xyz7bj	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	195	docalyer7pga	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 03:28:01.017363+00	2026-02-24 21:51:52.010729+00	f4w5b63umfkh	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	141	qizcqxxzvgwy	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-19 23:57:15.197219+00	2026-02-24 22:01:13.222358+00	rfpgruteosnt	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	201	eggggpfocqc5	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 22:15:00.696407+00	2026-02-24 23:41:36.011762+00	r5grlnblni7p	d58bad3e-9392-4a12-a993-6fc4e6954aba
00000000-0000-0000-0000-000000000000	198	ni2jkpcamp44	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 20:45:45.313394+00	2026-02-25 01:06:25.885881+00	d75eoqxmls2f	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	199	tmhedocymt2b	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 21:51:52.014011+00	2026-02-25 12:34:30.06953+00	docalyer7pga	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	197	h7mdfbibolet	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 19:55:09.758068+00	2026-02-25 13:19:09.54666+00	mxonon63anoe	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	200	wsb27teh6rsg	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 22:01:13.226815+00	2026-02-24 23:00:24.945203+00	qizcqxxzvgwy	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	202	xffgophen2ua	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 23:00:24.949804+00	2026-02-24 23:59:24.879063+00	wsb27teh6rsg	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	205	makdn27b6sf3	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-25 00:13:58.386959+00	2026-02-25 00:13:58.386959+00	\N	6f774b8d-5087-43d8-a088-6bf2ddb20fe4
00000000-0000-0000-0000-000000000000	206	4mj4hxho7nsn	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 01:06:25.902416+00	2026-02-25 02:04:59.811187+00	ni2jkpcamp44	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	209	odccntdhlui3	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 13:19:09.563059+00	2026-02-25 16:21:42.834221+00	h7mdfbibolet	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	210	pvgjvc25nzw3	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-25 16:21:42.840792+00	2026-02-25 16:21:42.840792+00	odccntdhlui3	451126f1-871d-46e4-bca0-2d991e8af084
00000000-0000-0000-0000-000000000000	208	d2srivbvalmj	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 12:34:30.104958+00	2026-02-25 20:44:57.929847+00	tmhedocymt2b	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	211	cfxje7nczfur	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 20:44:57.934561+00	2026-02-25 21:43:46.572269+00	d2srivbvalmj	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	212	x527kmcpwinp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 21:43:46.586656+00	2026-02-25 23:00:22.689859+00	cfxje7nczfur	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	214	ve5tivnjyf3c	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-26 12:57:47.354969+00	2026-02-26 18:28:04.015249+00	\N	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	215	bftj7rafnq5g	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-26 18:28:04.029369+00	2026-02-26 19:53:24.808204+00	ve5tivnjyf3c	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	216	2b4murofipyi	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-26 19:53:24.812058+00	2026-02-26 20:52:23.901298+00	bftj7rafnq5g	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	204	km6vpahublll	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 23:59:24.879951+00	2026-02-26 22:16:18.061259+00	xffgophen2ua	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	203	sbrdxnrr66hm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-24 23:41:36.01373+00	2026-02-26 22:35:19.957813+00	eggggpfocqc5	d58bad3e-9392-4a12-a993-6fc4e6954aba
00000000-0000-0000-0000-000000000000	219	kyj62wx4tc6s	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-26 22:35:19.964932+00	2026-02-26 22:35:19.964932+00	sbrdxnrr66hm	d58bad3e-9392-4a12-a993-6fc4e6954aba
00000000-0000-0000-0000-000000000000	217	ydmkl5yqqqzw	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-26 20:52:23.907123+00	2026-02-27 01:45:37.627605+00	2b4murofipyi	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	220	7ma5spbqulyf	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-27 01:45:37.640206+00	2026-02-27 03:17:56.606044+00	ydmkl5yqqqzw	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	221	hulrwysu5g7s	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-27 03:17:56.611133+00	2026-02-27 12:41:22.281803+00	7ma5spbqulyf	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	213	yi6xnugryozs	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 23:00:22.70187+00	2026-02-27 19:05:10.358413+00	x527kmcpwinp	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	223	imezt6jpxbuf	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-27 19:05:10.375373+00	2026-02-27 20:57:16.372671+00	yi6xnugryozs	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	218	kqjw7tzouemg	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-26 22:16:18.064537+00	2026-02-27 23:17:51.737225+00	km6vpahublll	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	222	lgysfvs4bfvo	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-27 12:41:22.306109+00	2026-02-28 00:44:50.54718+00	hulrwysu5g7s	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	226	v2dciiblszse	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 00:44:50.561692+00	2026-02-28 01:58:40.14735+00	lgysfvs4bfvo	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	227	ym4me5zoq6nj	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 01:58:40.161851+00	2026-02-28 03:02:15.502384+00	v2dciiblszse	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	228	xblf7pdunyta	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 03:02:15.514729+00	2026-02-28 12:01:46.109579+00	ym4me5zoq6nj	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	229	7rouatv2ubzi	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 12:01:46.126473+00	2026-02-28 13:00:54.988441+00	xblf7pdunyta	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	207	apwciuaggpcb	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-25 02:04:59.82509+00	2026-02-28 19:09:35.932308+00	4mj4hxho7nsn	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	231	af7s6qaib5gx	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 19:09:35.935363+00	2026-02-28 20:08:32.156324+00	apwciuaggpcb	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	232	qboi3fnkhadc	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 20:08:32.166823+00	2026-02-28 21:07:32.531063+00	af7s6qaib5gx	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	233	kmr3h6ywtqpz	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 21:07:32.532153+00	2026-02-28 22:06:06.163372+00	qboi3fnkhadc	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	230	uufzt5fsm5pu	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 13:00:55.012167+00	2026-02-28 23:14:39.737351+00	7rouatv2ubzi	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	235	yikmgow3iwpr	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-02-28 23:14:39.74083+00	2026-02-28 23:14:39.74083+00	uufzt5fsm5pu	b590cbc0-f140-48be-a2fe-d5635a844655
00000000-0000-0000-0000-000000000000	236	4xrdkwufer53	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-01 02:07:53.905881+00	2026-03-01 19:30:54.440884+00	\N	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	237	cyg3xzdaxqjm	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-01 19:30:54.463915+00	2026-03-01 20:29:56.325952+00	4xrdkwufer53	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	238	ovw6faq3ynjp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-01 20:29:56.331857+00	2026-03-01 23:54:25.691327+00	cyg3xzdaxqjm	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	239	ompk362trust	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-01 23:54:25.694153+00	2026-03-02 00:56:38.462517+00	ovw6faq3ynjp	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	224	h4665leghj6e	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-27 20:57:16.383101+00	2026-03-02 01:40:19.88438+00	imezt6jpxbuf	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	240	vwnlzdcsfpsi	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-02 00:56:38.4689+00	2026-03-02 20:06:03.592738+00	ompk362trust	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	234	jromea22xf2n	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-28 22:06:06.174167+00	2026-03-02 20:32:37.420174+00	kmr3h6ywtqpz	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	225	ud5bod35ranj	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-02-27 23:17:51.748492+00	2026-03-02 21:59:43.463257+00	kqjw7tzouemg	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	244	ziemyyb6bbdh	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-02 21:59:43.468804+00	2026-03-02 22:58:32.904717+00	ud5bod35ranj	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	245	nuyg7g6wld33	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-02 22:58:32.917299+00	2026-03-02 23:56:54.48956+00	ziemyyb6bbdh	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	246	5lfgxpo3ocfm	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-03-02 23:56:54.506793+00	2026-03-02 23:56:54.506793+00	nuyg7g6wld33	0d18e084-f4ce-4a59-a895-d7cb0da6a6d1
00000000-0000-0000-0000-000000000000	241	mql2cngggsrp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-02 01:40:19.88625+00	2026-03-03 13:24:07.305121+00	h4665leghj6e	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	247	vfuwhbu7wld2	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-03 13:24:07.329804+00	2026-03-03 14:35:59.852235+00	mql2cngggsrp	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	243	ji2vsmcwqtcp	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-02 20:32:37.44349+00	2026-03-03 16:12:12.049034+00	jromea22xf2n	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	249	6cdo4qiy4pzt	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-03 16:12:12.056884+00	2026-03-03 17:11:24.257641+00	ji2vsmcwqtcp	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	250	thpwysh5cmhy	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-03 17:11:24.275826+00	2026-03-03 18:10:36.565659+00	6cdo4qiy4pzt	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	248	ob4atnabesto	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-03 14:35:59.86101+00	2026-03-03 18:17:47.585377+00	vfuwhbu7wld2	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	242	vfd5fmxyg6ag	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-02 20:06:03.621639+00	2026-03-03 19:07:40.379866+00	vwnlzdcsfpsi	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	252	hfy2vewp6kyx	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-03-03 18:17:47.586823+00	2026-03-03 18:17:47.586823+00	ob4atnabesto	5c58f89c-f050-4127-8de5-3d2e65c2ad05
00000000-0000-0000-0000-000000000000	253	gr4aaynlehqc	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-03-03 19:07:40.380858+00	2026-03-03 19:07:40.380858+00	vfd5fmxyg6ag	d7c6c5c6-5762-4f30-a5e7-bae958bbeeec
00000000-0000-0000-0000-000000000000	251	yiul2gkleids	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-03 18:10:36.581431+00	2026-03-03 19:09:22.318381+00	thpwysh5cmhy	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	254	yg7dmvoz2rsa	8132d666-06c0-46a7-b362-a30393be96c0	t	2026-03-03 19:09:22.320335+00	2026-03-03 20:19:39.12062+00	yiul2gkleids	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
00000000-0000-0000-0000-000000000000	255	hfoppqqcqksc	8132d666-06c0-46a7-b362-a30393be96c0	f	2026-03-03 20:19:39.122089+00	2026-03-03 20:19:39.122089+00	yg7dmvoz2rsa	0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."schema_migrations" ("version") FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") FROM stdin;
df6a8c79-4591-405d-8a51-0493250c612b	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-03 00:24:04.374461+00	2026-02-03 00:24:04.374461+00	\N	aal1	\N	\N	node	38.50.159.222	\N	\N	\N	\N	\N
6f774b8d-5087-43d8-a088-6bf2ddb20fe4	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-25 00:13:58.370991+00	2026-02-25 00:13:58.370991+00	\N	aal1	\N	\N	node	162.220.234.78	\N	\N	\N	\N	\N
576b374f-80a7-4262-9266-63d2e054e880	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-20 22:12:37.081862+00	2026-02-20 22:12:37.081862+00	\N	aal1	\N	\N	node	177.200.33.18	\N	\N	\N	\N	\N
d814f65f-5c72-4074-b155-a819b0282bed	f0d4c34e-b761-4565-a91e-316c736e9f04	2026-01-25 21:21:34.133716+00	2026-01-27 01:50:55.509692+00	\N	aal1	\N	2026-01-27 01:50:55.509585	Next.js Middleware	177.200.32.136	\N	\N	\N	\N	\N
2d2af427-2d89-468a-8391-5cc5af5cef8b	f0d4c34e-b761-4565-a91e-316c736e9f04	2026-01-27 02:22:51.993117+00	2026-01-27 02:22:51.993117+00	\N	aal1	\N	\N	node	177.200.32.136	\N	\N	\N	\N	\N
eeff298e-bc5b-491f-82d3-bd9c39a274bd	f0d4c34e-b761-4565-a91e-316c736e9f04	2026-01-27 02:45:56.674381+00	2026-01-27 02:45:56.674381+00	\N	aal1	\N	\N	node	177.200.32.136	\N	\N	\N	\N	\N
dcd897e6-b892-4606-9486-3efb34003ba8	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-03 22:20:58.596615+00	2026-02-03 23:47:45.592867+00	\N	aal1	\N	2026-02-03 23:47:45.592744	Vercel Edge Functions	56.125.111.236	\N	\N	\N	\N	\N
451126f1-871d-46e4-bca0-2d991e8af084	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-20 19:37:03.280154+00	2026-02-25 16:21:42.855707+00	\N	aal1	\N	2026-02-25 16:21:42.855583	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	177.200.33.18	\N	\N	\N	\N	\N
0d18e084-f4ce-4a59-a895-d7cb0da6a6d1	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-12 23:56:41.122085+00	2026-03-02 23:56:54.528056+00	\N	aal1	\N	2026-03-02 23:56:54.527949	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	177.107.32.46	\N	\N	\N	\N	\N
93bf1daa-e3e5-4aea-bdbe-86071571be0f	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-31 22:21:02.324378+00	2026-02-04 02:24:29.212013+00	\N	aal1	\N	2026-02-04 02:24:29.211897	Next.js Middleware	162.220.232.227	\N	\N	\N	\N	\N
669ff5ff-39ca-4b2f-ae37-150c7b154712	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-04 13:55:54.877363+00	2026-02-04 13:55:54.877363+00	\N	aal1	\N	\N	node	162.220.234.164	\N	\N	\N	\N	\N
ecad5e77-dc89-4fa8-8d96-bce5eaacefbe	f0d4c34e-b761-4565-a91e-316c736e9f04	2026-01-27 03:21:54.352352+00	2026-01-29 02:11:13.037544+00	\N	aal1	\N	2026-01-29 02:11:13.037412	Next.js Middleware	177.200.35.127	\N	\N	\N	\N	\N
5c58f89c-f050-4127-8de5-3d2e65c2ad05	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-21 05:04:41.118834+00	2026-03-03 18:17:47.590922+00	\N	aal1	\N	2026-03-03 18:17:47.590814	Next.js Middleware	8.228.114.50	\N	\N	\N	\N	\N
d7c6c5c6-5762-4f30-a5e7-bae958bbeeec	8132d666-06c0-46a7-b362-a30393be96c0	2026-03-01 02:07:53.872302+00	2026-03-03 19:07:40.384205+00	\N	aal1	\N	2026-03-03 19:07:40.384113	Next.js Middleware	8.228.114.50	\N	\N	\N	\N	\N
af174363-57df-454b-b1b2-6cfaa7428929	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-21 17:00:09.235932+00	2026-02-21 19:02:52.679241+00	\N	aal1	\N	2026-02-21 19:02:52.679142	okhttp/4.12.0	177.200.33.18	\N	\N	\N	\N	\N
ed3bf0ff-976c-4556-8b02-444836460859	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-29 14:01:27.5194+00	2026-02-05 19:11:22.102349+00	\N	aal1	\N	2026-02-05 19:11:22.102201	Vercel Edge Functions	52.67.72.15	\N	\N	\N	\N	\N
42e31f83-1f38-4fa5-806d-9939d1fdc3d9	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-29 22:59:16.778437+00	2026-01-30 00:56:42.896585+00	\N	aal1	\N	2026-01-30 00:56:42.896474	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	38.50.159.222	\N	\N	\N	\N	\N
1290ede9-194b-44bb-b0cb-26de00bfda07	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-01 21:01:28.483742+00	2026-02-05 20:50:34.649344+00	\N	aal1	\N	2026-02-05 20:50:34.649213	Next.js Middleware	177.200.35.127	\N	\N	\N	\N	\N
b590cbc0-f140-48be-a2fe-d5635a844655	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-26 12:57:47.342135+00	2026-02-28 23:14:40.378689+00	\N	aal1	\N	2026-02-28 23:14:40.378595	Next.js Middleware	162.220.234.152	\N	\N	\N	\N	\N
c92b876b-37bb-4a60-a921-143ea9d26ae3	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-29 02:14:44.471681+00	2026-02-06 01:44:46.017475+00	\N	aal1	\N	2026-02-06 01:44:46.017361	Next.js Middleware	177.200.35.127	\N	\N	\N	\N	\N
b3fcc254-f846-4073-bb13-bf3cd84c4a40	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-11 01:03:06.498092+00	2026-02-11 01:03:06.498092+00	\N	aal1	\N	\N	node	177.200.32.197	\N	\N	\N	\N	\N
56b27e3f-a3c4-4889-89f3-fd455d98ce20	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-29 02:50:00.456324+00	2026-01-31 03:25:54.173594+00	\N	aal1	\N	2026-01-31 03:25:54.1735	Vercel Edge Functions	15.228.167.68	\N	\N	\N	\N	\N
d58bad3e-9392-4a12-a993-6fc4e6954aba	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-19 22:33:41.274414+00	2026-02-26 22:35:19.974385+00	\N	aal1	\N	2026-02-26 22:35:19.974252	Next.js Middleware	177.107.32.46	\N	\N	\N	\N	\N
6293793b-f8c4-4bbe-b1d0-7c5c763aa8cc	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-19 00:47:56.945591+00	2026-02-20 02:17:12.09478+00	\N	aal1	\N	2026-02-20 02:17:12.094673	Next.js Middleware	162.220.234.73	\N	\N	\N	\N	\N
0d1d41aa-7a15-484f-bcd0-dcc30bb3df3c	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-19 01:10:34.824083+00	2026-03-03 20:19:41.492039+00	\N	aal1	\N	2026-03-03 20:19:41.491946	Next.js Middleware	177.200.33.194	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at", "disabled") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
00000000-0000-0000-0000-000000000000	8132d666-06c0-46a7-b362-a30393be96c0	authenticated	authenticated	wfixtech.contato@gmail.com	$2a$10$iKx2rR88H1E6HxIyqnZcvOJI3ygoFoDJKzI4q4A.VuY75DgT2PrPK	2026-01-29 22:58:19.259992+00	\N		2026-01-29 02:13:33.460365+00		\N			\N	2026-03-01 02:07:53.87218+00	{"provider": "email", "providers": ["email"]}	{"sub": "8132d666-06c0-46a7-b362-a30393be96c0", "email": "wtechinformatica02@gmail.com", "full_name": "Wheslan", "email_verified": true, "phone_verified": false}	\N	2026-01-29 02:13:33.400623+00	2026-03-03 20:19:39.123452+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f0d4c34e-b761-4565-a91e-316c736e9f04	authenticated	authenticated	admin@wtech.com	$2a$10$NYHqRG0ERWbZf1ogj81EzeE3Gcuwr6xDl7zq8Wp5LA00dMHQ8CLem	2026-01-25 21:18:06.666959+00	\N		\N		\N			\N	2026-01-27 03:21:54.348896+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2026-01-25 21:18:06.641928+00	2026-01-29 02:11:13.023352+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY "cron"."job" ("jobid", "schedule", "command", "nodename", "nodeport", "database", "username", "active", "jobname") FROM stdin;
3	0 8 * * *	 \r\n       SELECT net.http_post(\r\n           url:='https://n8n.wfixtech.com.br/webhook/69c76519-7cc6-440e-96b4-4ca23065461f', -- URL SEM O "-test"\r\n           headers:='{"Content-Type": "application/json"}'::jsonb,\r\n           body:='{"origem": "cron_supabase_prod"}'::jsonb\r\n       );\r\n    	localhost	5432	postgres	postgres	t	lembrete_diario_wfix
\.


--
-- Data for Name: job_run_details; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY "cron"."job_run_details" ("jobid", "runid", "job_pid", "database", "username", "command", "status", "return_message", "start_time", "end_time") FROM stdin;
3	1	1110113	postgres	postgres	 \r\n       SELECT net.http_post(\r\n           url:='https://n8n.wfixtech.com.br/webhook/69c76519-7cc6-440e-96b4-4ca23065461f', -- URL SEM O "-test"\r\n           headers:='{"Content-Type": "application/json"}'::jsonb,\r\n           body:='{"origem": "cron_supabase_prod"}'::jsonb\r\n       );\r\n    	succeeded	1 row	2026-02-27 08:00:00.900359+00	2026-02-27 08:00:00.947419+00
3	5	1149917	postgres	postgres	 \r\n       SELECT net.http_post(\r\n           url:='https://n8n.wfixtech.com.br/webhook/69c76519-7cc6-440e-96b4-4ca23065461f', -- URL SEM O "-test"\r\n           headers:='{"Content-Type": "application/json"}'::jsonb,\r\n           body:='{"origem": "cron_supabase_prod"}'::jsonb\r\n       );\r\n    	succeeded	1 row	2026-03-03 08:00:00.523705+00	2026-03-03 08:00:00.764879+00
3	2	1120604	postgres	postgres	 \r\n       SELECT net.http_post(\r\n           url:='https://n8n.wfixtech.com.br/webhook/69c76519-7cc6-440e-96b4-4ca23065461f', -- URL SEM O "-test"\r\n           headers:='{"Content-Type": "application/json"}'::jsonb,\r\n           body:='{"origem": "cron_supabase_prod"}'::jsonb\r\n       );\r\n    	succeeded	1 row	2026-02-28 08:00:00.483347+00	2026-02-28 08:00:00.677104+00
3	3	1130398	postgres	postgres	 \r\n       SELECT net.http_post(\r\n           url:='https://n8n.wfixtech.com.br/webhook/69c76519-7cc6-440e-96b4-4ca23065461f', -- URL SEM O "-test"\r\n           headers:='{"Content-Type": "application/json"}'::jsonb,\r\n           body:='{"origem": "cron_supabase_prod"}'::jsonb\r\n       );\r\n    	succeeded	1 row	2026-03-01 08:00:00.788966+00	2026-03-01 08:00:01.104836+00
3	4	1139953	postgres	postgres	 \r\n       SELECT net.http_post(\r\n           url:='https://n8n.wfixtech.com.br/webhook/69c76519-7cc6-440e-96b4-4ca23065461f', -- URL SEM O "-test"\r\n           headers:='{"Content-Type": "application/json"}'::jsonb,\r\n           body:='{"origem": "cron_supabase_prod"}'::jsonb\r\n       );\r\n    	succeeded	1 row	2026-03-02 08:00:00.500162+00	2026-03-02 08:00:00.695543+00
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customers" ("id", "user_id", "name", "phone", "document_id", "notes", "created_at", "updated_at") FROM stdin;
10805a50-bd56-4919-ad10-d21cbb4683ed	f0d4c34e-b761-4565-a91e-316c736e9f04	João da Silva	62991911074	12345678900	\N	2026-01-25 21:22:02.829226+00	2026-01-25 21:22:02.829226+00
5b1ab2cf-0e92-4925-b31f-ba851357cd7c	f0d4c34e-b761-4565-a91e-316c736e9f04	Maria	62991376399	00669812129	\N	2026-01-27 02:50:49.401129+00	2026-01-27 02:50:49.401129+00
d33dedeb-804b-4978-9d81-0beef142722e	8132d666-06c0-46a7-b362-a30393be96c0	Wheslan	62991911064	02331048100	\N	2026-01-29 02:51:51.228705+00	2026-01-29 02:51:51.228705+00
81f82741-f7fc-4499-a071-618bbb9ebd6f	8132d666-06c0-46a7-b362-a30393be96c0	Patricia Bastos Ricardo Barcelos	62994324883	0047749148	\N	2026-01-29 14:55:33.220561+00	2026-01-29 14:55:33.220561+00
93058f00-6bf6-4747-8f8a-39331ccc1207	8132d666-06c0-46a7-b362-a30393be96c0	Zenaide Araujo de Menezes 	62998081492	05789702104	\N	2026-01-31 15:06:22.030092+00	2026-01-31 15:06:22.030092+00
6895fff2-e089-4cfb-93e5-2966fdafc847	8132d666-06c0-46a7-b362-a30393be96c0	Walliston Albernas	62984025006	70006198139	\N	2026-02-23 18:10:14.349899+00	2026-02-23 18:10:14.349899+00
7df5b26c-903e-4578-9a12-354e0677c57d	8132d666-06c0-46a7-b362-a30393be96c0	Leandra Pereira Costa 	62982726667	71091254168	\N	2026-02-25 20:48:29.827517+00	2026-02-25 20:48:29.827517+00
a90026b4-dbe3-4cf0-99cd-5a4e21c7b4ec	8132d666-06c0-46a7-b362-a30393be96c0	Cassiana Moreira	5562981156665	06253962191	\N	2026-02-27 19:23:20.316752+00	2026-02-27 19:23:20.316752+00
\.


--
-- Data for Name: equipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."equipments" ("id", "customer_id", "type", "brand", "model", "serial_number", "notes", "created_at", "updated_at", "remote_access_id", "remote_access_password") FROM stdin;
2ecd5bab-9783-41bf-a23b-c0a4a6b2279b	10805a50-bd56-4919-ad10-d21cbb4683ed	desktop	Desktop	Desktop	\N	Senha: 123	2026-01-25 21:22:03.194534+00	2026-01-25 21:22:03.194534+00	\N	\N
a6777afd-518d-479a-9fc2-6245f6697507	10805a50-bd56-4919-ad10-d21cbb4683ed	printer	Epson	l3250	\N	\N	2026-01-26 19:39:33.798907+00	2026-01-26 19:39:33.798907+00	\N	\N
ae3904ab-c8e9-4c42-b59e-17771aba2c01	10805a50-bd56-4919-ad10-d21cbb4683ed	printer	Canon	G3110	\N	\N	2026-01-26 20:16:52.847604+00	2026-01-26 20:16:52.847604+00	\N	\N
8af96b25-1258-420e-937b-4e7517f8f636	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	notebook	Dell	Ideapad 330	\N	\N	2026-01-27 02:50:49.956304+00	2026-01-27 02:50:49.956304+00	\N	\N
d0be9902-22cc-403c-aec6-3dddb1d578a5	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	printer	Epson	L3250	\N	\N	2026-01-27 03:33:45.479693+00	2026-01-27 03:33:45.479693+00	\N	\N
d86b02e2-a165-4d73-a388-917f26c62ccd	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	notebook	Dell	Inspiron 15	\N	\N	2026-01-27 14:35:18.380559+00	2026-01-27 14:35:18.380559+00	\N	\N
2d471c11-1e42-4d3a-8341-29c380d1595c	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	notebook	Acer	Nitro V15	\N	\N	2026-01-28 12:39:22.627167+00	2026-01-28 12:39:22.627167+00	\N	\N
41109255-ce07-4daa-9eb3-686a7434ac4e	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	desktop	Desktop	Desktop	\N	\N	2026-01-28 13:42:02.945509+00	2026-01-28 13:42:02.945509+00	\N	\N
ffb8fdc2-6cff-4004-a98b-c63d48407445	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	All in One	Dell	EC24250	\N	\N	2026-01-29 00:34:52.657384+00	2026-01-29 00:34:52.657384+00	\N	\N
f70132fb-c943-431f-b2c7-52cafe00e24c	d33dedeb-804b-4978-9d81-0beef142722e	Impressora	Epson	L4260	\N	\N	2026-01-29 02:51:51.394551+00	2026-01-29 02:51:51.394551+00	\N	\N
3f0a4857-5a65-4f89-8d0b-ca3034391b12	81f82741-f7fc-4499-a071-618bbb9ebd6f	Impressora	Epson	L4260	\N	\N	2026-01-29 14:55:33.65702+00	2026-01-29 14:55:33.65702+00	\N	\N
de268aaa-13bb-454f-8340-f0c38c5d676b	d33dedeb-804b-4978-9d81-0beef142722e	Desktop	PC	\N	\N	\N	2026-01-30 01:50:48.078357+00	2026-01-30 01:50:48.078357+00	\N	\N
fa72aac1-b875-4c7a-82b1-3d1ceae6d888	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 13:26:39.20358+00	2026-01-30 13:26:39.20358+00	\N	\N
583318bf-87e0-4a04-a100-9df91eb53f82	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo 	T480	\N	\N	2026-01-30 14:12:58.838101+00	2026-01-30 14:12:58.838101+00	\N	\N
82c9d208-62d5-412b-a329-ac39350f7348	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 16:08:52.90223+00	2026-01-30 16:08:52.90223+00	\N	\N
642d07b7-ee36-42b9-9c01-bc5ee33ca04d	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 16:10:21.377352+00	2026-01-30 16:10:21.377352+00	\N	\N
75d94e93-c9cc-4a0f-b411-ca02094e8e46	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 16:33:31.935373+00	2026-01-30 16:33:31.935373+00	\N	\N
43fa7b5a-1697-4d7d-a4a9-12e0d48e857f	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 16:49:46.503772+00	2026-01-30 16:49:46.503772+00	\N	\N
555a8006-a441-4691-ba99-b7705c6b7f0e	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 17:46:14.480161+00	2026-01-30 17:46:14.480161+00	\N	\N
4a5ea79e-2810-4f01-b2e1-4357d1ee38a6	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	PE04JTG8	\N	2026-01-30 18:25:02.293364+00	2026-01-30 18:25:02.293364+00	\N	\N
3dbf0c02-0da8-41fa-b70f-89291949af84	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-01-30 19:30:37.873774+00	2026-01-30 19:30:37.873774+00	\N	\N
132d5c03-a626-4e18-9f84-8808ce201be6	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	\N	\N	\N	\N	2026-01-30 19:49:37.362423+00	2026-01-30 19:49:37.362423+00	\N	\N
aa5a6756-250e-4285-b461-6fc14720fc87	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-01 21:05:29.445104+00	2026-02-01 21:05:29.445104+00	\N	\N
32447c15-50a3-4ee7-ab8e-e990b72f1e5d	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-02 00:58:11.957934+00	2026-02-02 00:58:11.957934+00	\N	\N
1aa52198-90e1-4d2f-b64c-1286cd47cc98	d33dedeb-804b-4978-9d81-0beef142722e	Desktop	Montagem	\N	\N	\N	2026-02-02 02:23:03.507625+00	2026-02-02 02:23:03.507625+00	\N	\N
a4efc6d7-2495-44ae-883c-bdecb9553225	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Acer 	Predator Helios 300	\N	\N	2026-02-02 03:28:42.327688+00	2026-02-02 03:28:42.327688+00	\N	\N
35be6c9d-1235-42f2-a8bf-06b5b3a965cc	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-02 23:03:22.993206+00	2026-02-02 23:03:22.993206+00	\N	\N
413d94ad-e659-441c-a35b-27dbe0e6616d	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-12 23:58:32.051729+00	2026-02-12 23:58:32.051729+00	\N	\N
98572fc2-00cb-4054-bffa-f2815027ad38	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Asus	K52JC	\N	\N	2026-02-13 23:42:04.007206+00	2026-02-13 23:42:04.007206+00	\N	\N
00e337f1-2285-4a2d-9956-f822bdc7e998	d33dedeb-804b-4978-9d81-0beef142722e	Desktop	\N	\N	\N	\N	2026-02-19 02:39:54.625145+00	2026-02-19 02:39:54.625145+00	\N	\N
852d6df6-3a78-4fe5-b054-5b2e7d030883	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-19 02:46:54.098157+00	2026-02-19 02:46:54.098157+00	\N	\N
c50425c9-7372-4edf-997d-fe792bf73872	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-19 14:27:48.265393+00	2026-02-19 14:27:48.265393+00	\N	\N
e95151d2-fa02-464b-8d2b-00612a172ee3	d33dedeb-804b-4978-9d81-0beef142722e	Impressora	Epson	L3250	\N	\N	2026-02-22 16:53:55.168017+00	2026-02-22 16:53:55.168017+00	\N	\N
211a438a-442e-42fa-bfbb-19cf87335849	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	Thinkpad T480	\N	\N	2026-02-22 19:11:11.798248+00	2026-02-22 19:11:11.798248+00	\N	\N
babac2ba-d0df-40a4-aa92-559949a38d20	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-22 22:39:55.111549+00	2026-02-22 22:39:55.111549+00	\N	\N
169c26b0-5888-4b4e-a1fd-a741cb420059	6895fff2-e089-4cfb-93e5-2966fdafc847	Desktop	\N	\N	\N	\N	2026-02-23 18:10:14.727003+00	2026-02-23 18:10:14.727003+00	\N	\N
70c3f5bc-4eee-4cf1-bfc6-5547862b9254	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-24 23:42:05.347941+00	2026-02-24 23:42:05.347941+00	\N	\N
7d46d876-6fcc-41f8-bfa1-10856c763a25	d33dedeb-804b-4978-9d81-0beef142722e	Desktop	\N	\N	\N	\N	2026-02-25 01:07:07.194587+00	2026-02-25 01:07:07.194587+00	\N	\N
749e34b5-e09c-4203-b892-635542168bef	7df5b26c-903e-4578-9a12-354e0677c57d	Impressora	HP	GT5822	P0R22A	\N	2026-02-25 20:48:30.021863+00	2026-02-25 20:48:30.021863+00	\N	\N
ffdefb43-5eee-47ce-a98e-c2c9aa46cdcd	a90026b4-dbe3-4cf0-99cd-5a4e21c7b4ec	All in One	Lenovo	Ideacentre A340	F0E8004YBP	\N	2026-02-27 19:23:20.695527+00	2026-02-27 19:23:20.695527+00	\N	\N
83f399d7-51b6-4e55-a2b0-6a0c644bcaa9	d33dedeb-804b-4978-9d81-0beef142722e	Notebook	Lenovo	T480	\N	\N	2026-02-28 21:33:16.403314+00	2026-02-28 21:33:16.403314+00	\N	\N
5792ff22-05a7-4d7d-8f43-a33a5b6046de	93058f00-6bf6-4747-8f8a-39331ccc1207	Impressora	HP	Ink Tank Wireless 416	Z4B55A	\N	2026-01-31 15:06:22.442733+00	2026-03-03 18:05:18.158456+00	1738751120	Wfixtech.255
\.


--
-- Data for Name: follow_ups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."follow_ups" ("id", "order_id", "customer_id", "type", "status", "scheduled_for", "completed_at", "skipped_at", "notes", "created_at", "updated_at") FROM stdin;
7a4ed30c-ccd7-4ae9-aa65-96b20372a7bd	fa7be202-ac86-4a5a-8f5b-f320ff72a100	93058f00-6bf6-4747-8f8a-39331ccc1207	post_delivery	pending	2026-02-07	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
c18342e4-3d9c-4ac9-968a-3efd6228e5c0	4147ed5d-62fc-448e-98e4-302805f134f9	10805a50-bd56-4919-ad10-d21cbb4683ed	post_delivery	skipped	2026-02-02	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
f8c7dd50-d74a-4f1c-b14b-bd50fc1b6fe6	32e76718-e0ba-4c61-a377-12c01dcecd37	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	post_delivery	skipped	2026-02-03	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
ed61d19e-070c-411e-951d-eb33b6a68fd3	b5f8c2ff-c88e-43ac-adad-4a82043fff9a	10805a50-bd56-4919-ad10-d21cbb4683ed	post_delivery	skipped	2026-02-02	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
ecea367d-b08d-4ece-99f4-1c9db6fa223b	e3ad3109-7020-44c8-b1ea-5ed50eef8306	10805a50-bd56-4919-ad10-d21cbb4683ed	post_delivery	skipped	2026-02-02	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
14a92ee8-bed2-4df9-a135-b0583c836f47	14edef18-6243-4695-9855-c95de19b499c	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	post_delivery	pending	2026-02-03	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
086e6550-b683-4874-89a4-e7873773731a	2963822e-92e4-4141-bb91-18b1230636a2	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	post_delivery	pending	2026-02-03	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
d431dfb3-a10e-4dbc-a3e1-59fa02a5c558	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	post_delivery	pending	2026-02-04	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
4b74f6ee-5742-42e2-827b-bf44431b3cc9	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	post_delivery	pending	2026-02-04	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
c59d4e54-89f7-4156-b81c-ec96102135fc	ab0da644-3889-4321-a726-0f18b5fdae1f	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	post_delivery	pending	2026-02-05	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
401a5b86-c5fd-42ed-ae43-78109931d2f0	fa7be202-ac86-4a5a-8f5b-f320ff72a100	93058f00-6bf6-4747-8f8a-39331ccc1207	warranty_expiring	pending	2026-04-24	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
0e9ca086-95b7-43bd-a2db-72a7877d1655	4147ed5d-62fc-448e-98e4-302805f134f9	10805a50-bd56-4919-ad10-d21cbb4683ed	warranty_expiring	pending	2026-04-19	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
c6efa9ee-3960-4e2c-9628-4dde16222fe1	32e76718-e0ba-4c61-a377-12c01dcecd37	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	warranty_expiring	pending	2026-04-20	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
b59d59c9-1118-4d28-a62b-753675bd2326	b5f8c2ff-c88e-43ac-adad-4a82043fff9a	10805a50-bd56-4919-ad10-d21cbb4683ed	warranty_expiring	pending	2026-04-19	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
04cb5c8b-e4d1-4b94-b31a-8cd5bebd262a	e3ad3109-7020-44c8-b1ea-5ed50eef8306	10805a50-bd56-4919-ad10-d21cbb4683ed	warranty_expiring	pending	2026-04-19	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
6b64f7ed-0771-4905-a319-c5eb62ef5e70	14edef18-6243-4695-9855-c95de19b499c	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	warranty_expiring	pending	2026-04-20	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
6f019778-469e-4e38-be28-65beaa98f319	2963822e-92e4-4141-bb91-18b1230636a2	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	warranty_expiring	pending	2026-04-20	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
24966f3a-d3d1-4baf-bb23-15537e48cc3a	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	warranty_expiring	pending	2026-04-21	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
fa883395-5cd5-4e10-ad10-242a223d8a30	dda80cb0-8696-4b87-9ff4-99c347ae5bb8	81f82741-f7fc-4499-a071-618bbb9ebd6f	warranty_expiring	pending	2026-04-22	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
9ba194c6-fdcf-471a-9c45-34899387e4e8	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	warranty_expiring	pending	2026-04-21	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
4c46ba61-bcd3-438e-be07-734d8722afd5	ab0da644-3889-4321-a726-0f18b5fdae1f	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	warranty_expiring	pending	2026-04-22	\N	\N	\N	2026-02-03 03:12:37.260111+00	2026-02-03 03:12:37.260111+00
c1c86874-0cba-47d0-a3e3-0838d7619d3f	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	6895fff2-e089-4cfb-93e5-2966fdafc847	post_delivery	pending	2026-03-03	\N	\N	\N	2026-02-24 01:10:53.937142+00	2026-02-24 01:10:53.937142+00
1caa8ee1-b265-4b43-9caa-1cc34a433eb0	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	6895fff2-e089-4cfb-93e5-2966fdafc847	warranty_expiring	pending	2026-05-18	\N	\N	\N	2026-02-24 01:10:53.937142+00	2026-02-24 01:10:53.937142+00
96d50794-9e71-4eff-92e3-868f2df058cc	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	d33dedeb-804b-4978-9d81-0beef142722e	post_delivery	pending	2026-03-04	\N	\N	\N	2026-02-25 01:34:22.379353+00	2026-02-25 01:34:22.379353+00
80a4bc47-c78b-493f-9ce2-748a3444e9c5	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	d33dedeb-804b-4978-9d81-0beef142722e	warranty_expiring	pending	2026-05-19	\N	\N	\N	2026-02-25 01:34:22.379353+00	2026-02-25 01:34:22.379353+00
bad38a48-41a1-4568-8709-194dc0fa2b30	0a7f3186-810e-4794-9740-112ce37b1ec4	7df5b26c-903e-4578-9a12-354e0677c57d	post_delivery	pending	2026-03-04	\N	\N	\N	2026-02-25 21:52:18.652092+00	2026-02-25 21:52:18.652092+00
3d567654-50e0-4da3-abac-32b9e4a07c04	0a7f3186-810e-4794-9740-112ce37b1ec4	7df5b26c-903e-4578-9a12-354e0677c57d	warranty_expiring	pending	2026-08-17	\N	\N	\N	2026-02-25 21:52:18.652092+00	2026-02-25 21:52:18.652092+00
df5b7736-b59f-4a8a-b2ed-8c4371a8da25	dda80cb0-8696-4b87-9ff4-99c347ae5bb8	81f82741-f7fc-4499-a071-618bbb9ebd6f	post_delivery	completed	2026-02-05	2026-03-02 22:19:42.464+00	\N	Cliente confirmou funcionamento normal\n02/03/26	2026-02-03 03:12:37.260111+00	2026-03-02 22:19:42.464+00
\.


--
-- Data for Name: hardware_telemetry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."hardware_telemetry" ("id", "order_id", "equipment_id", "tenant_id", "source_type", "ssd_health_percent", "ssd_tbw", "cpu_temp_max", "battery_cycles", "battery_wear_level", "raw_content", "health_score", "created_at", "cpu_model", "motherboard_model", "ram_total_gb", "gpu_model", "stage", "ssd_total_gb", "ram_speed", "ram_slots") FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."leads" ("id", "created_at", "name", "email", "company", "message", "source", "tenant_id", "company_name", "phone", "device_count", "service_interest", "status") FROM stdin;
\.


--
-- Data for Name: nps_feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."nps_feedbacks" ("id", "order_id", "customer_id", "score", "comment", "discount_code", "is_redeemed", "created_at", "clicked_google_review", "clicked_google_review_at") FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."order_items" ("id", "order_id", "title", "type", "price", "external_url", "notes", "created_at", "is_external_part", "part_status", "estimated_price") FROM stdin;
0f152d48-f341-467d-ba5c-2f4733a5ca38	e3ad3109-7020-44c8-b1ea-5ed50eef8306	SSD 240GB	part_external	0.00	https://www.mercadolivre.com.br/hd-ssd-interno-western-digital-wd-green-wds240g1g0a-240gb/p/MLB6309497#polycard_client=search-desktop&search_layout=grid&position=5&type=product&tracking_id=1840e9ab-5764-4bd6-98bb-2f2db327294e&wid=MLB5893225732&sid=search	\N	2026-01-26 19:22:17.685054+00	f	pending	\N
d4dd667f-ce9d-4bd1-9b26-31ec4fe7011d	b5f8c2ff-c88e-43ac-adad-4a82043fff9a	Cabeça de impressao	part_external	0.00	https://www.mercadolivre.com.br/cabeca-impresso-epson-l3110-l3150-l3210-l3250-l4150-l4160/p/MLB44318954#polycard_client=search-desktop&search_layout=grid&position=1&type=product&tracking_id=bfe40d45-0514-4d9d-8624-8faa340f6837&wid=MLB4373673347&sid=search	\N	2026-01-26 19:40:22.65214+00	f	pending	\N
4cd746fb-63c9-4c2f-b05d-a28deb6b5aaa	4147ed5d-62fc-448e-98e4-302805f134f9	Cabeça de impressão	part_external	0.00	https://www.mercadolivre.com.br/cabeca-impresso-epson-l3110-l3150-l3210-l3250-l4150-l4160/p/MLB44318954#polycard_client=search-desktop&search_layout=grid&position=1&type=product&tracking_id=bfe40d45-0514-4d9d-8624-8faa340f6837&wid=MLB4373673347&sid=search	\N	2026-01-26 20:17:25.327398+00	f	pending	\N
d8d95d5d-1179-46b1-a4b3-51ab577a6b26	32e76718-e0ba-4c61-a377-12c01dcecd37	SSD 240GB Kingston	part_external	0.00	https://www.mercadolivre.com.br/ssd-a400-240gb-disco-solido-interno-kingston-suv400s37240g-cor-preto/p/MLB25647027#polycard_client=search-desktop&search_layout=grid&position=5&type=product&tracking_id=8cf2c89e-07de-460d-8583-b93b0f14267b&wid=MLB6200719540&sid=search	\N	2026-01-27 02:54:33.789818+00	f	arrived	\N
b82dba84-5e88-46de-85f3-258e034d9c19	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	Placa Mãe Gigabyte B450M DS3H V2	part_external	0.00	https://www.google.com/aclk?sa=L&ai=DChsSEwi6ztiI-PCSAxVCUEgAHY10McEYACICCAEQBxoCY2U&ae=1&co=1&ase=2&gclid=CjwKCAiAkvDMBhBMEiwAnUA9BSroQnO8o9ZwcyIAg8HvkTSI-QYo-mYOF7CuTHgcxeTg7DJSSNfZahoCwIYQAvD_BwE&sph=&ei=svmcaeTEIfP61sQPx_DDqQg&cid=CAAS0gHkaLx6svO32ryZgbmbKkP_UkGtEiMhKfxfc7Pe47O71f1ZTrr2xXQPRVF1gwmSUCgG74XCxDBF0z9GXXOBgktijew5I9AE2vx40n1svP9CC3r0tL1auLvdCtrOV09BGBcMlcGmQDkwuGUkFxTpAP1PLWYcGcicRhJSTAXbuPbyMQvKOO2WNwdnGC8IkrM0Fg5gHrS3FN6ugTtnMhtZhWWMi1heILH8j8bwa-7l1ByC3x-k-GmtNp_OMYW4yH0DUCHaxiD8s9JT-0LFHTxSXW8xouI&cce=2&category=acrcp_v1_34&sig=AOD64_3LBE0jEnrqiOUMBmF5r8GaGVUUVg&ctype=70&q=&nis=4&sqi=2&ved=2ahUKEwjk5dKI-PCSAxVzvZUCHUf4MIUQwg8oAHoECAsQDg&adurl=intent://www.mercadolivre.com.br/placa-me-amd-gigabyte-ga-b450m-ds3h-v2-am4-preto/p/MLB22610269%3Fpdp_filters%3Ditem_id%253AMLB4467605469%26from%3Dgshop%26matt_tool%3D56885173%26matt_internal_campaign_id%3D%26matt_word%3D%26matt_source%3Dgoogle%26matt_campaign_id%3D22090354256%26matt_ad_group_id%3D197094190251%26matt_match_type%3D%26matt_network%3Dg%26matt_device%3Dm%26matt_creative%3D792355617483%26matt_keyword%3D%26matt_ad_position%3D%26matt_ad_type%3Dpla%26matt_merchant_id%3D735125422%26matt_product_id%3DMLB22610269-product%26matt_product_partition_id%3D2454704125131%26matt_target_id%3Daud-1967156880386:pla-2454704125131%26cq_src%3Dgoogle_ads%26cq_cmp%3D22090354256%26cq_net%3Dg%26cq_plt%3Dgp%26cq_med%3Dpla%26gad_source%3D1%26gad_campaignid%3D22090354256%26gbraid%3D0AAAAAD93qcC6KCS-NSwDE9r8u1cjXK3Er%26gclid%3DCjwKCAiAkvDMBhBMEiwAnUA9BSroQnO8o9ZwcyIAg8HvkTSI-QYo-mYOF7CuTHgcxeTg7DJSSNfZahoCwIYQAvD_BwE%23Intent%3Bscheme%3Dhttps%3Bpackage%3Dcom.mercadolibre%3BS.browser_fallback_url%3Dhttps://www.mercadolivre.com.br/placa-me-amd-gigabyte-ga-b450m-ds3h-v2-am4-preto/p/MLB22610269%253Fpdp_filters%253Ditem_id%25253AMLB4467605469%2526from%253Dgshop%2526matt_tool%253D56885173%2526matt_internal_campaign_id%253D%2526matt_word%253D%2526matt_source%253Dgoogle%2526matt_campaign_id%253D22090354256%2526matt_ad_group_id%253D197094190251%2526matt_match_type%253D%2526matt_network%253Dg%2526matt_device%253Dm%2526matt_creative%253D792355617483%2526matt_keyword%253D%2526matt_ad_position%253D%2526matt_ad_type%253Dpla%2526matt_merchant_id%253D735125422%2526matt_product_id%253DMLB22610269-product%2526matt_product_partition_id%253D2454704125131%2526matt_target_id%253Daud-1967156880386:pla-2454704125131%2526cq_src%253Dgoogle_ads%2526cq_cmp%253D22090354256%2526cq_net%253Dg%2526cq_plt%253Dgp%2526cq_med%253Dpla%2526gad_source%253D1%2526gad_campaignid%253D22090354256%2526gbraid%253D0AAAAAD93qcC6KCS-NSwDE9r8u1cjXK3Er%3Bend	\N	2026-02-24 01:07:14.35344+00	f	arrived	\N
9c1c4e7b-cb63-446a-a9f0-87bd5ad1497a	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	Memória RAM DDR4 16GB SODIMM	part_external	0.00	https://www.mercadolivre.com.br/memoria-ram-crucial-16gb-ddr4-3200mhz-para-notebook/up/MLBU3162825226?matt_tool=18956390&pdp_filters=item_id:MLB4052445351	\N	2026-01-28 12:43:22.911494+00	f	arrived	\N
00e89c3a-a787-42d7-8e8c-45f9bb9c709f	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	Fonte Redragon RGPS 500W	part_external	0.00	https://www.mercadolivre.com.br/fonte-redragon-rgps-500-watts-80-plus-white-preto-preto/p/MLB48597530#polycard_client=search-desktop&search_layout=grid&position=6&type=product&tracking_id=5fc3dcbb-3e8f-48a9-b401-0d1cfcff32a5&wid=MLB5632994602&sid=search	\N	2026-01-28 13:43:19.991032+00	f	arrived	\N
cbf73375-c5e5-4b0f-b6c6-1ee4e98bebe8	79ad84e4-04ee-4782-a477-83dac544b04a	Bateria T480	part_external	176.00	\N	\N	2026-02-25 00:04:46.779098+00	f	arrived	\N
1c93102e-734f-408b-9126-57bad1b2eb7b	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	Fonte 700w	part_external	529.00	\N	\N	2026-02-25 01:09:39.009006+00	f	arrived	\N
94af0693-c8cb-4743-9106-cc2b071597d7	4ee4f39d-f2f2-4091-8d50-189d1dacbf05	Memória RAM DDR4 SODIMM	part_external	0.00	https://www.mercadolivre.com.br/p/MLB11011362?pdp_filters=item_id:MLB6079769596&matt_tool=38524122#origin=share&sid=share&wid=MLB6079769596&action=copy	\N	2026-02-27 19:28:09.419418+00	f	pending	\N
\.


--
-- Data for Name: order_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."order_logs" ("id", "order_id", "previous_status", "new_status", "changed_by", "changed_by_type", "metadata", "created_at") FROM stdin;
b19f1776-e247-4e1a-9d14-3dbac9cfac82	e3ad3109-7020-44c8-b1ea-5ed50eef8306	\N	finished	\N	system	{"reason": "Migração inicial", "migrated_at": "2026-01-27T00:57:58.795343+00:00"}	2026-01-27 00:57:58.795343+00
39d57af0-b337-45d6-b563-a8db1a94b32e	4147ed5d-62fc-448e-98e4-302805f134f9	\N	finished	\N	system	{"reason": "Migração inicial", "migrated_at": "2026-01-27T00:57:58.795343+00:00"}	2026-01-27 00:57:58.795343+00
cc0fe3af-500b-4925-8c7e-5ba408f6b512	b5f8c2ff-c88e-43ac-adad-4a82043fff9a	\N	finished	\N	system	{"reason": "Migração inicial", "migrated_at": "2026-01-27T00:57:58.795343+00:00"}	2026-01-27 00:57:58.795343+00
4d09ceae-f019-4bbc-9c77-6aec7bce861e	32e76718-e0ba-4c61-a377-12c01dcecd37	open	analyzing	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T02:53:20.61643+00:00"}	2026-01-27 02:53:20.61643+00
388d7913-5071-49f6-9e56-2430e4304954	32e76718-e0ba-4c61-a377-12c01dcecd37	analyzing	waiting_approval	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T02:54:33.158746+00:00"}	2026-01-27 02:54:33.158746+00
7175d78d-3dc5-420c-b2c6-69de62cc3c8f	32e76718-e0ba-4c61-a377-12c01dcecd37	waiting_approval	waiting_parts	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T02:55:49.829776+00:00"}	2026-01-27 02:55:49.829776+00
fe048d3d-9677-48bd-b2a3-1d24612a9c2d	32e76718-e0ba-4c61-a377-12c01dcecd37	waiting_parts	in_progress	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T02:56:25.616504+00:00"}	2026-01-27 02:56:25.616504+00
ccd189e5-0e39-4456-85c9-c753586a8777	32e76718-e0ba-4c61-a377-12c01dcecd37	in_progress	finished	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T02:57:08.052357+00:00"}	2026-01-27 02:57:08.052357+00
78717d28-7ef0-46da-9276-e89212938bfb	14edef18-6243-4695-9855-c95de19b499c	open	analyzing	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T13:06:17.55287+00:00"}	2026-01-27 13:06:17.55287+00
553157fc-48be-41f7-88f2-1484d9ade729	14edef18-6243-4695-9855-c95de19b499c	analyzing	waiting_approval	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T13:06:57.374924+00:00"}	2026-01-27 13:06:57.374924+00
e52dcc98-88c2-4c43-9656-cf65bce4aa7c	14edef18-6243-4695-9855-c95de19b499c	waiting_approval	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T13:07:23.430217+00:00"}	2026-01-27 13:07:23.430217+00
68bce842-f40c-4868-9262-d205cc6b419e	14edef18-6243-4695-9855-c95de19b499c	in_progress	finished	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T14:17:58.806713+00:00"}	2026-01-27 14:17:58.806713+00
a85ebabe-4f48-48bd-9272-636254ba5614	2963822e-92e4-4141-bb91-18b1230636a2	open	analyzing	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T14:35:30.888232+00:00"}	2026-01-27 14:35:30.888232+00
c27c1c04-f76a-4ce2-beda-38b71753e47c	2963822e-92e4-4141-bb91-18b1230636a2	analyzing	waiting_approval	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T14:35:52.781908+00:00"}	2026-01-27 14:35:52.781908+00
36a074ff-e9a3-4316-845f-983b68d195ac	2963822e-92e4-4141-bb91-18b1230636a2	waiting_approval	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T15:54:59.786943+00:00"}	2026-01-27 15:54:59.786943+00
50d73c41-c478-491d-88c1-c7fb2d8ec271	2963822e-92e4-4141-bb91-18b1230636a2	in_progress	finished	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-27T15:58:55.054437+00:00"}	2026-01-27 15:58:55.054437+00
799c4c84-8468-4fe3-84cc-8fd17744a65a	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	open	analyzing	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T12:39:45.641156+00:00"}	2026-01-28 12:39:45.641156+00
4bc7452c-848b-4b64-89b5-6889907b9f8b	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	analyzing	waiting_approval	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T12:43:22.109635+00:00"}	2026-01-28 12:43:22.109635+00
43a3cf51-9ea7-4ab4-8a0d-f3bdb0b4c6d9	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	waiting_approval	waiting_parts	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T12:46:40.699634+00:00"}	2026-01-28 12:46:40.699634+00
44a21234-affd-424b-acb1-b7dcd96dd9c4	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	waiting_parts	in_progress	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T12:47:23.800686+00:00"}	2026-01-28 12:47:23.800686+00
74153bab-d8c7-4fad-9bed-cf3d58c1ea07	71a1bb73-9e85-40cd-b4b5-2570dd2da77e	in_progress	finished	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T12:49:57.455966+00:00"}	2026-01-28 12:49:57.455966+00
7c43518d-84cd-4abe-9d39-74076004f7be	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	open	analyzing	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T13:42:09.582619+00:00"}	2026-01-28 13:42:09.582619+00
4de0301f-70d1-4c09-9dba-48077e0f0f02	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	analyzing	waiting_approval	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T13:43:19.379169+00:00"}	2026-01-28 13:43:19.379169+00
33344244-b93f-4867-8846-a46fe53749b8	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	waiting_approval	waiting_parts	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T13:43:42.608444+00:00"}	2026-01-28 13:43:42.608444+00
e5a274ad-ee79-46c7-80c8-5e0cba7fa031	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	waiting_parts	in_progress	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T13:44:00.193902+00:00"}	2026-01-28 13:44:00.193902+00
5dac7721-e02a-4de5-bdc8-994a814aa5a3	f4cb3d3e-011d-446b-bae1-a77c05ddfcee	in_progress	finished	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-28T13:45:03.300589+00:00"}	2026-01-28 13:45:03.300589+00
48483558-1488-44a7-b09a-18f7df56b574	ab0da644-3889-4321-a726-0f18b5fdae1f	open	analyzing	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T00:42:30.058417+00:00"}	2026-01-29 00:42:30.058417+00
5a047741-191a-4fb4-970c-444997247237	ab0da644-3889-4321-a726-0f18b5fdae1f	analyzing	waiting_approval	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T00:43:09.676148+00:00"}	2026-01-29 00:43:09.676148+00
82dd3c6c-a500-424c-a0a7-1f9f06a8c247	ab0da644-3889-4321-a726-0f18b5fdae1f	waiting_approval	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T00:44:01.556876+00:00"}	2026-01-29 00:44:01.556876+00
fca88b81-46a0-46c3-9bf5-50f33b089298	ab0da644-3889-4321-a726-0f18b5fdae1f	in_progress	finished	f0d4c34e-b761-4565-a91e-316c736e9f04	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T00:45:06.592822+00:00"}	2026-01-29 00:45:06.592822+00
1b5435c7-dea1-4a81-bed5-ca74def36cef	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-24T01:04:19.648644+00:00"}	2026-02-24 01:04:19.648644+00
913899fc-fc37-4933-a60c-2bf2dda5b9f6	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	waiting_parts	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-24T01:10:03.815047+00:00"}	2026-02-24 01:10:03.815047+00
e91ba503-120c-4785-a0b5-83906e680ca0	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	in_progress	finished	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-24T01:10:53.643201+00:00"}	2026-02-24 01:10:53.643201+00
be0a7427-053b-4a8d-9e90-c610de728874	79ad84e4-04ee-4782-a477-83dac544b04a	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T00:04:45.371832+00:00"}	2026-02-25 00:04:45.371832+00
d5f9a39e-074c-4a03-9207-c0bc35df5eb1	dda80cb0-8696-4b87-9ff4-99c347ae5bb8	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T14:55:41.012697+00:00"}	2026-01-29 14:55:41.012697+00
2ed4173d-4421-4d25-8dd3-84c60b7f8b27	dda80cb0-8696-4b87-9ff4-99c347ae5bb8	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T14:56:19.591515+00:00"}	2026-01-29 14:56:19.591515+00
265b5ee2-7494-4918-b834-ce577e464ce5	dda80cb0-8696-4b87-9ff4-99c347ae5bb8	waiting_approval	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T14:59:19.823602+00:00"}	2026-01-29 14:59:19.823602+00
597b7b25-7db0-40b7-b4a1-d7b9163346dd	dda80cb0-8696-4b87-9ff4-99c347ae5bb8	in_progress	finished	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-29T15:01:41.414869+00:00"}	2026-01-29 15:01:41.414869+00
1535d1fe-f485-4bca-89c8-d2382acfc992	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T01:09:38.232091+00:00"}	2026-02-25 01:09:38.232091+00
e269b202-2de0-4c0b-9863-05f33ad76125	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	in_progress	finished	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T01:34:21.406078+00:00"}	2026-02-25 01:34:21.406078+00
7dcb4167-8e77-4590-8a0a-1b347ebbd297	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-24T01:07:14.017298+00:00"}	2026-02-24 01:07:14.017298+00
cb57dbee-a1bc-4c7c-9a83-278888919ee0	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	waiting_parts	in_progress	\N	customer	{"reason": "Peças recebidas (Confirmado pelo Cliente via Link Público - IP: 2804:389:a109:b9c4:3892:94ff:fe05:1fd3)"}	2026-02-24 01:10:04.057+00
be21af60-c848-40ea-b6b7-6241ee383b5b	79ad84e4-04ee-4782-a477-83dac544b04a	waiting_approval	waiting_parts	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T00:12:17.338421+00:00"}	2026-02-25 00:12:17.338421+00
82590a3a-0586-49cc-89af-2f7cbdac105f	79ad84e4-04ee-4782-a477-83dac544b04a	waiting_parts	in_progress	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T00:12:42.713516+00:00"}	2026-02-25 00:12:42.713516+00
63222133-04d9-479b-8c91-cb7f81f7d878	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	waiting_approval	waiting_parts	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T01:21:54.417301+00:00"}	2026-02-25 01:21:54.417301+00
c6f64821-8322-4b28-878a-c4c28497c6b6	0a7f3186-810e-4794-9740-112ce37b1ec4	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T20:48:40.184591+00:00"}	2026-02-25 20:48:40.184591+00
dc47c3c8-0d17-4d66-99b4-63c155acfd79	0a7f3186-810e-4794-9740-112ce37b1ec4	waiting_approval	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T21:50:57.578131+00:00"}	2026-02-25 21:50:57.578131+00
be140266-de37-4d04-932e-5b2ff03b5e5b	4ee4f39d-f2f2-4091-8d50-189d1dacbf05	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-27T19:24:08.121725+00:00"}	2026-02-27 19:24:08.121725+00
f5ce3418-c9b7-4029-9210-40d771535f9e	fe0195ec-ecba-462a-96dd-419d38b68f0e	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-28T21:33:22.712331+00:00"}	2026-02-28 21:33:22.712331+00
834a300b-6e71-4515-8617-a43d5148893f	fa7be202-ac86-4a5a-8f5b-f320ff72a100	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-31T15:06:33.813809+00:00"}	2026-01-31 15:06:33.813809+00
ab6a86c0-795b-4d99-b8e0-2c866b7705f4	fa7be202-ac86-4a5a-8f5b-f320ff72a100	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-31T15:06:58.170053+00:00"}	2026-01-31 15:06:58.170053+00
666328f9-54be-4e05-bcd9-278f61e4d6e4	fa7be202-ac86-4a5a-8f5b-f320ff72a100	waiting_approval	in_progress	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-31T15:08:44.752317+00:00"}	2026-01-31 15:08:44.752317+00
ab2161ef-8b3a-4c0d-bac3-ea6dd08ffad2	fa7be202-ac86-4a5a-8f5b-f320ff72a100	in_progress	finished	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-01-31T15:16:48.966655+00:00"}	2026-01-31 15:16:48.966655+00
c05c3e95-f9e2-44e1-9278-46102d03082c	4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	waiting_approval	waiting_parts	\N	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-24T01:09:33.599796+00:00"}	2026-02-24 01:09:33.599796+00
3e97fea3-30d7-4446-98ea-cd3f1c3539ea	79ad84e4-04ee-4782-a477-83dac544b04a	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-24T23:42:21.971364+00:00"}	2026-02-24 23:42:21.971364+00
f7db578c-0e9a-4df0-8a57-e125b69ef4ff	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	open	analyzing	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T01:07:13.00093+00:00"}	2026-02-25 01:07:13.00093+00
605b8c95-fae9-4f17-aa47-6e0e2da11211	8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	waiting_parts	in_progress	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T01:28:56.69866+00:00"}	2026-02-25 01:28:56.69866+00
84cad6b2-e4d6-4df8-91da-18864f73d4fe	0a7f3186-810e-4794-9740-112ce37b1ec4	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T21:29:36.791041+00:00"}	2026-02-25 21:29:36.791041+00
f2ac90a2-ef81-4df6-aac5-970f1e8d980a	0a7f3186-810e-4794-9740-112ce37b1ec4	in_progress	finished	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-25T21:52:18.33545+00:00"}	2026-02-25 21:52:18.33545+00
4dfb1c63-49c2-4954-8647-47e14edf61fd	4ee4f39d-f2f2-4091-8d50-189d1dacbf05	analyzing	waiting_approval	8132d666-06c0-46a7-b362-a30393be96c0	technician	{"trigger_type": "automatic", "triggered_at": "2026-02-27T19:28:08.879294+00:00"}	2026-02-27 19:28:08.879294+00
bc39ca00-ed9e-4eea-9570-54328058484a	fe0195ec-ecba-462a-96dd-419d38b68f0e	open	analyzing	\N	customer	{"reason": "Custódia assinada (Click-Wrap). Hash: 50400e99..."}	2026-02-28 21:34:37.534+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."orders" ("id", "display_id", "user_id", "customer_id", "equipment_id", "status", "labor_cost", "parts_cost_external", "diagnosis_text", "solution_text", "created_at", "updated_at", "finished_at", "canceled_at", "approved_at", "payment_method", "amount_received", "payment_received_at", "part_arrival_date", "signature_metadata", "photos_checkin", "photos_checkout", "integrity_hash", "execution_tasks", "sequential_number", "signature_evidence", "store_snapshot", "accessories_received", "custody_conditions", "custody_geo_lat", "custody_geo_lng", "custody_integrity_hash", "custody_signature_url", "custody_signed_at", "custody_ip", "custody_photos", "problem_description", "discount_amount", "coupon_code", "warranty_days", "warranty_start_date", "warranty_end_date", "checkout_checklist", "parts_sourcing_mode") FROM stdin;
8c3a19ef-7f32-4c0c-844e-d564d0b6a54e	2026WF-0006	8132d666-06c0-46a7-b362-a30393be96c0	d33dedeb-804b-4978-9d81-0beef142722e	7d46d876-6fcc-41f8-bfa1-10856c763a25	finished	200.00	529.00	Fonte queimada, necessário substituir fonte	\N	2026-02-25 01:07:07.458082+00	2026-02-25 01:34:21.406078+00	2026-02-25 01:34:20.209+00	\N	2026-02-25 01:21:52.673+00	pix	200.00	2026-02-25 01:34:20.209+00	2026-02-25 01:28:55.017+00	\N	{}	{}	\N	[]	6	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": true, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-02-25T01:21:45.720Z", "content_hash": "v1"}, {"id": "data_backup", "title": "2. Dados e Backup (LGPD)", "accepted_at": "2026-02-25T01:21:45.720Z", "content_hash": "v1"}, {"id": "abandonment", "title": "3. Política de Abandono", "accepted_at": "2026-02-25T01:21:45.720Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "4. Validade e Taxas", "accepted_at": "2026-02-25T01:21:45.720Z", "content_hash": "v1"}]}, "ip_address": "::1", "accepted_at": "2026-02-25T01:21:52.383Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "857f40df607d40ce8678509ac71b9a12ec44a9f2e53cfecb49b286c20e75583a", "device_fingerprint": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1"}	{"phone": "62994516025", "address": {"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 07", "neighborhood": "Irisville"}, "logo_url": null, "trade_name": "WFIX", "legal_document": "023331048100", "warranty_days_labor": 90}	\N	\N	\N	\N	\N	\N	\N	\N	[]	Não está ligando	0	\N	90	2026-02-25 01:34:20.209+00	2026-05-26 01:34:20.209+00	{"testes_ok": false, "limpeza_ok": false, "acessorios_ok": false, "cliente_ciente": false}	resale
fa7be202-ac86-4a5a-8f5b-f320ff72a100	2026WF-0003	8132d666-06c0-46a7-b362-a30393be96c0	93058f00-6bf6-4747-8f8a-39331ccc1207	5792ff22-05a7-4d7d-8f43-a33a5b6046de	finished	140.00	0.00	Manutenção corretiva e preventiva com tentativa de desobstrução da cabeça de impressão 	\N	2026-01-31 15:06:22.638082+00	2026-02-03 03:12:37.260111+00	2026-01-31 15:16:48.864+00	\N	2026-01-31 15:08:44.653+00	pix	140.00	2026-01-31 15:16:48.864+00	\N	\N	{}	{}	\N	[]	3	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": false, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-01-31T15:08:40.483Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-01-31T15:08:40.483Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-01-31T15:08:40.483Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-01-31T15:08:40.483Z", "content_hash": "v1"}]}, "ip_address": "179.248.93.138", "accepted_at": "2026-01-31T15:08:44.422Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "6a054d934f6711a5b6726125f66459562a2aaab45a616f9d7fa1e6aa5019bdd6", "device_fingerprint": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_6_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Mobile/15E148 Safari/604.1"}	{"phone": "62994516025", "address": {"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 07", "neighborhood": "Irisville"}, "logo_url": null, "trade_name": "WFIX", "legal_document": "023331048100", "warranty_days_labor": 90}	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-31 15:16:48.864+00	2026-05-01 15:16:48.864+00	\N	assisted
4147ed5d-62fc-448e-98e4-302805f134f9	2026WTI-0003	f0d4c34e-b761-4565-a91e-316c736e9f04	10805a50-bd56-4919-ad10-d21cbb4683ed	ae3904ab-c8e9-4c42-b59e-17771aba2c01	finished	240.00	0.00	Substituir cartuchos	\N	2026-01-26 20:16:53.243307+00	2026-02-03 03:12:37.260111+00	2026-01-26 20:18:47.429+00	\N	2026-01-26 20:18:12.427+00	\N	\N	\N	\N	\N	{}	{}	\N	[]	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-26 20:18:47.429+00	2026-04-26 20:18:47.429+00	\N	assisted
0a7f3186-810e-4794-9740-112ce37b1ec4	2026WF-0007	8132d666-06c0-46a7-b362-a30393be96c0	7df5b26c-903e-4578-9a12-354e0677c57d	749e34b5-e09c-4203-b892-635542168bef	finished	50.00	0.00	Identificada dificuldade no mecanismo de alimentação de papel e obstrução nas mangueiras do reservatório de tinta, resultando em impressões em branco.\n\nNecessário efetuar a troca das mangueiras do reservatório de tintas\n\nEfetuada troca do cartucho preto. Tentativa de instalação do cartucho colorido não foi bem-sucedida devido a falha de reconhecimento.\n\nImpressões coloridas com falhas e cor ausência da cor magenta	\N	2026-02-25 20:48:30.171648+00	2026-02-25 21:52:18.33545+00	2026-02-25 21:52:18.248+00	\N	2026-02-25 21:50:57.452+00	pix	50.00	2026-02-25 21:52:18.248+00	\N	\N	{}	{}	\N	[]	7	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": false, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-02-25T21:50:54.373Z", "content_hash": "v1"}, {"id": "data_backup", "title": "2. Dados e Backup (LGPD)", "accepted_at": "2026-02-25T21:50:54.373Z", "content_hash": "v1"}, {"id": "abandonment", "title": "3. Política de Abandono", "accepted_at": "2026-02-25T21:50:54.373Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "4. Validade e Taxas", "accepted_at": "2026-02-25T21:50:54.373Z", "content_hash": "v1"}]}, "ip_address": "191.121.220.235", "accepted_at": "2026-02-25T21:50:57.064Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "a608f68dce5d6f4a60f158608b981cb9f026d52d9963f7aa56d888dbadc2bd68", "device_fingerprint": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1"}	{"phone": "62994516025", "address": {"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 07", "neighborhood": "Irisville"}, "logo_url": null, "trade_name": "WFIX", "legal_document": "023331048100", "warranty_days_labor": 180}	\N	\N	\N	\N	\N	\N	\N	\N	[]	Troca dos cartuchos	0	\N	180	2026-02-25 21:52:18.248+00	2026-08-24 21:52:18.248+00	{"testes_ok": true, "limpeza_ok": false, "acessorios_ok": false, "cliente_ciente": false}	assisted
4ee4f39d-f2f2-4091-8d50-189d1dacbf05	2026WF-0008	8132d666-06c0-46a7-b362-a30393be96c0	a90026b4-dbe3-4cf0-99cd-5a4e21c7b4ec	ffdefb43-5eee-47ce-a98e-c2c9aa46cdcd	waiting_approval	280.00	0.00	Máquina com memória RAM insuficiente (4GB)\n\nMáquina com alta temperatura durante execução dos testes\n\nRealizar upgrade de memória RAM com adição de pente de memória de 8GB (totalizando 12gb)\n\nHigienização e troca da pasta térmica 	\N	2026-02-27 19:23:20.8731+00	2026-02-27 19:28:08.879294+00	\N	\N	\N	\N	\N	\N	\N	\N	{}	{}	\N	[]	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	Máquina lenta durante o uso	0	\N	90	\N	\N	\N	assisted
32e76718-e0ba-4c61-a377-12c01dcecd37	2026WTI-0004	f0d4c34e-b761-4565-a91e-316c736e9f04	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	8af96b25-1258-420e-937b-4e7517f8f636	finished	260.00	0.00	- Reinstalação do sistema operacional\n\n- Upgrade de HD para SSD 240GB	\N	2026-01-27 02:50:50.243767+00	2026-02-03 03:12:37.260111+00	2026-01-27 02:57:04.625+00	\N	2026-01-27 02:55:46.412+00	pix	240.00	2026-01-27 02:57:04.625+00	2026-01-27 02:56:22.184+00	{"ip": "::ffff:172.19.0.1", "hasParts": true, "timestamp": "2026-01-27T02:55:45.878Z", "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36", "approvedAt": "2026-01-27T02:55:45.958Z", "acceptedTerms": true}	{https://wddebrieixjcxurtggmb.supabase.co/storage/v1/object/public/os-evidence/32e76718-e0ba-4c61-a377-12c01dcecd37/checkin/1769482377757_0.jpg}	{}	\N	[]	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-27 02:57:04.625+00	2026-04-27 02:57:04.625+00	\N	assisted
b5f8c2ff-c88e-43ac-adad-4a82043fff9a	2026WTI-0002	f0d4c34e-b761-4565-a91e-316c736e9f04	10805a50-bd56-4919-ad10-d21cbb4683ed	a6777afd-518d-479a-9fc2-6245f6697507	finished	240.00	0.00	Substituir cabeça de impressão	\N	2026-01-26 19:39:34.064701+00	2026-02-03 03:12:37.260111+00	2026-01-26 20:16:03.647+00	\N	\N	\N	\N	\N	\N	\N	{}	{}	\N	[]	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-26 20:16:03.647+00	2026-04-26 20:16:03.647+00	\N	assisted
e3ad3109-7020-44c8-b1ea-5ed50eef8306	2026WTI-0001	f0d4c34e-b761-4565-a91e-316c736e9f04	10805a50-bd56-4919-ad10-d21cbb4683ed	2ecd5bab-9783-41bf-a23b-c0a4a6b2279b	finished	240.00	0.00	SSD com defeito\nSubstituir SSD	\N	2026-01-25 21:22:03.46084+00	2026-02-03 03:12:37.260111+00	2026-01-26 19:22:56.34+00	\N	\N	\N	\N	\N	\N	\N	{}	{}	\N	[]	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-26 19:22:56.34+00	2026-04-26 19:22:56.34+00	\N	assisted
14edef18-6243-4695-9855-c95de19b499c	2026WTI-0005	f0d4c34e-b761-4565-a91e-316c736e9f04	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	d0be9902-22cc-403c-aec6-3dddb1d578a5	finished	260.00	0.00	Manutenção corretiva e preventiva com tentativa de reparo do pickup roller	\N	2026-01-27 03:33:45.748491+00	2026-02-03 03:12:37.260111+00	2026-01-27 14:17:55.642+00	\N	2026-01-27 13:07:20.284+00	pix	260.00	2026-01-27 14:17:55.642+00	\N	{"ip": "::ffff:172.19.0.1", "hasParts": false, "timestamp": "2026-01-27T13:07:19.507Z", "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36", "approvedAt": "2026-01-27T13:07:19.988Z", "acceptedTerms": false}	{}	{}	\N	[{"id": "task_1769519341845", "title": "Retirando o pick up roller", "completed": false, "completed_at": null}, {"id": "task_1769519368753", "title": "Realizando reparo do pickup roller", "completed": false, "completed_at": null}, {"id": "task_1769519377911", "title": "Verificando funcionamento", "completed": false, "completed_at": null}, {"id": "task_1769519388109", "title": "Realizando testes de impressões", "completed": false, "completed_at": null}, {"id": "task_1769521061363", "title": "Retirando pickup roller", "completed": false, "completed_at": null}, {"id": "task_1769521546960", "title": "teste", "completed": false, "completed_at": null}, {"id": "task_1769521943172", "title": "teste2", "completed": false, "completed_at": null}, {"id": "task_1769522287845", "title": "teste3", "completed": false, "completed_at": null}]	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-27 14:17:55.642+00	2026-04-27 14:17:55.642+00	\N	assisted
4d33ad39-c9ad-4fe5-b9b8-268a7efd8ea8	2026WF-0004	8132d666-06c0-46a7-b362-a30393be96c0	6895fff2-e089-4cfb-93e5-2966fdafc847	169c26b0-5888-4b4e-a1fd-a741cb420059	finished	700.00	0.00	Realizado testes porém máquina continuou inoperante, realizado testes com fonte e processador de teste porém sem nenhum êxito.\n\nRealizado troca da placa mãe, máquina voltou a ligar a funcionar 	\N	2026-02-23 18:10:14.872695+00	2026-02-25 02:03:58.634905+00	2026-02-24 01:10:53.567+00	\N	2026-02-24 01:09:33.327+00	pix	700.00	2026-02-24 01:10:53.567+00	2026-02-24 01:10:03.725+00	\N	{}	{}	\N	[]	4	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": true, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-02-24T01:09:31.428Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-02-24T01:09:31.428Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-02-24T01:09:31.428Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-02-24T01:09:31.428Z", "content_hash": "v1"}]}, "ip_address": "164.163.249.203", "accepted_at": "2026-02-24T01:09:32.900Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "ac496f2c29ec0a4d79dbedc938656345ad999ca8232151917b2226cd2220bdd7", "device_fingerprint": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Mobile/15E148 Safari/604.1"}	{"phone": "62994516025", "address": {"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 07", "neighborhood": "Irisville"}, "logo_url": null, "trade_name": "WFIX", "legal_document": "023331048100", "warranty_days_labor": 90}	\N	\N	\N	\N	\N	\N	\N	\N	[]	Não está ligando, líquido derramado na placa mãe 	0	\N	90	2026-02-24 01:10:53.567+00	2026-05-25 01:10:53.567+00	{"testes_ok": true, "limpeza_ok": true, "acessorios_ok": false, "cliente_ciente": true}	assisted
2963822e-92e4-4141-bb91-18b1230636a2	2026WTI-0006	f0d4c34e-b761-4565-a91e-316c736e9f04	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	d86b02e2-a165-4d73-a388-917f26c62ccd	finished	240.00	0.00	Reinstalação do sistema	\N	2026-01-27 14:35:18.685851+00	2026-02-03 03:12:37.260111+00	2026-01-27 15:58:51.734+00	\N	2026-01-27 15:54:56.363+00	cash	240.00	2026-01-27 15:58:51.734+00	\N	{"ip": "::ffff:172.19.0.1", "hasParts": false, "timestamp": "2026-01-27T15:54:55.298Z", "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36", "approvedAt": "2026-01-27T15:54:55.944Z", "signedName": "Maria", "termsVersion": "v1_2026", "approvalMethod": "type-to-sign-granular-wizard-v3", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-01-27T15:54:44.976Z", "content_hash": "v1"}, {"id": "risks_opening", "title": "2. Riscos de Abertura e Vedação", "accepted_at": "2026-01-27T15:54:44.976Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-01-27T15:54:44.976Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-01-27T15:54:44.976Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-01-27T15:54:44.976Z", "content_hash": "v1"}]}	{}	{}	\N	[{"id": "task_1769529340405", "title": "Realizado backup das pastas de usuário", "completed": true, "completed_at": "2026-01-27T15:56:52.529Z"}, {"id": "task_1769529347846", "title": "Reinstalando sistema operacional", "completed": true, "completed_at": "2026-01-27T15:58:22.044Z"}, {"id": "task_1769529477532", "title": "Restaurando backup e instalando programas", "completed": true, "completed_at": "2026-01-27T15:58:28.351Z"}, {"id": "task_1769529497133", "title": "Equipamento finalizado", "completed": true, "completed_at": "2026-01-27T15:58:34.564Z"}]	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-27 15:58:51.734+00	2026-04-27 15:58:51.734+00	\N	assisted
fe0195ec-ecba-462a-96dd-419d38b68f0e	2026WF-0009	8132d666-06c0-46a7-b362-a30393be96c0	d33dedeb-804b-4978-9d81-0beef142722e	83f399d7-51b6-4e55-a2b0-6a0c644bcaa9	analyzing	0.00	0.00	Relato do cliente:\nDesligando sozinho\n\nSem acessórios	\N	2026-02-28 21:33:16.687423+00	2026-02-28 21:34:40.199694+00	\N	\N	\N	\N	\N	\N	\N	\N	{}	{}	\N	[]	9	\N	\N	{}		\N	\N	50400e9985881692ba5653d3ed4a8b353db5980dce356b9536fb85c8cfc43a33	\N	2026-02-28 21:34:36.828+00	::1	[]	Desligando sozinho	0	\N	90	\N	\N	\N	assisted
71a1bb73-9e85-40cd-b4b5-2570dd2da77e	2026WTI-0007	f0d4c34e-b761-4565-a91e-316c736e9f04	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	2d471c11-1e42-4d3a-8341-29c380d1595c	finished	240.00	0.00	Realizado troca da pasta termica e limpeza do cooler\nSugestão de upgrade: adicionar memória ram de 16gb	\N	2026-01-28 12:39:22.910828+00	2026-02-03 03:12:37.260111+00	2026-01-28 12:49:54.176+00	\N	2026-01-28 12:46:37.429+00	pix	240.00	2026-01-28 12:49:54.176+00	2026-01-28 12:47:20.522+00	{"ip": "::ffff:172.19.0.1", "hasParts": true, "timestamp": "2026-01-28T12:46:36.481Z", "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36", "approvedAt": "2026-01-28T12:46:37.127Z", "signedName": "Maria", "termsVersion": "v1_2026", "approvalMethod": "type-to-sign-granular-wizard-v3", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-01-28T12:45:49.366Z", "content_hash": "v1"}, {"id": "risks_opening", "title": "2. Riscos de Abertura e Vedação", "accepted_at": "2026-01-28T12:45:49.366Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-01-28T12:45:49.366Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-01-28T12:45:49.366Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-01-28T12:45:49.366Z", "content_hash": "v1"}]}	{}	{}	\N	[]	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-28 12:49:54.176+00	2026-04-28 12:49:54.176+00	\N	assisted
dda80cb0-8696-4b87-9ff4-99c347ae5bb8	2026WT-0002	8132d666-06c0-46a7-b362-a30393be96c0	81f82741-f7fc-4499-a071-618bbb9ebd6f	3f0a4857-5a65-4f89-8d0b-ca3034391b12	finished	200.00	0.00	Manutenção corretiva e preventiva com reparo da placa rede e instalação de impressora na rede \nReparo da unidade de limpeza \nReset do contador de almofada	\N	2026-01-29 14:55:33.879681+00	2026-02-03 03:12:37.260111+00	2026-01-29 15:01:41.041+00	\N	2026-01-29 14:59:19.717+00	pix	200.00	2026-01-29 15:01:41.041+00	\N	\N	{}	{}	\N	[]	2	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": false, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-01-29T14:59:15.332Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-01-29T14:59:15.332Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-01-29T14:59:15.332Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-01-29T14:59:15.332Z", "content_hash": "v1"}]}, "ip_address": "177.67.29.47", "accepted_at": "2026-01-29T14:59:19.284Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "9ed0a7e7f16e98c7f39f21049ef23132400c5f640f181af3fe7a560943f14228", "device_fingerprint": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Mobile/15E148 Safari/604.1"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-29 15:01:41.041+00	2026-04-29 15:01:41.041+00	\N	assisted
f4cb3d3e-011d-446b-bae1-a77c05ddfcee	2026WTI-0008	f0d4c34e-b761-4565-a91e-316c736e9f04	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	41109255-ce07-4daa-9eb3-686a7434ac4e	finished	240.00	0.00	Equipamento não está ligando\nFonte com defeito\nSubstituir fonte	\N	2026-01-28 13:42:03.262493+00	2026-02-03 03:12:37.260111+00	2026-01-28 13:44:59.943+00	\N	2026-01-28 13:43:39.253+00	pix	240.00	2026-01-28 13:44:59.943+00	2026-01-28 13:43:56.836+00	\N	{}	{}	\N	[{"id": "task_1769607850175", "title": "Retirando a fonte", "completed": true, "completed_at": "2026-01-28T13:44:12.121Z"}, {"id": "task_1769607861779", "title": "Colocando a fonte nova", "completed": true, "completed_at": "2026-01-28T13:44:45.003Z"}, {"id": "task_1769607869425", "title": "Realizando testes finais", "completed": true, "completed_at": "2026-01-28T13:44:48.106Z"}]	8	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": true, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-01-28T13:43:31.155Z", "content_hash": "v1"}, {"id": "risks_opening", "title": "2. Riscos de Abertura e Vedação", "accepted_at": "2026-01-28T13:43:31.155Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-01-28T13:43:31.155Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-01-28T13:43:31.155Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-01-28T13:43:31.155Z", "content_hash": "v1"}]}, "ip_address": "::ffff:172.19.0.1", "accepted_at": "2026-01-28T13:43:39.009Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "generated-on-server", "device_fingerprint": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-28 13:44:59.943+00	2026-04-28 13:44:59.943+00	\N	assisted
ab0da644-3889-4321-a726-0f18b5fdae1f	2026WTI-0009	f0d4c34e-b761-4565-a91e-316c736e9f04	5b1ab2cf-0e92-4925-b31f-ba851357cd7c	ffb8fdc2-6cff-4004-a98b-c63d48407445	finished	160.00	0.00	Reinstalação do sistema operacional com tentativa de backup	\N	2026-01-29 00:34:52.965841+00	2026-02-03 03:12:37.260111+00	2026-01-29 00:45:03.269+00	\N	2026-01-29 00:43:58.108+00	card_machine	160.00	2026-01-29 00:45:03.269+00	\N	\N	{}	{}	\N	[{"id": "task_1769647467381", "title": "Realizando backup", "completed": true, "completed_at": "2026-01-29T00:44:31.295Z"}, {"id": "task_1769647477962", "title": "Realizando reinstalação do sistema", "completed": true, "completed_at": "2026-01-29T00:44:40.524Z"}, {"id": "task_1769647486925", "title": "Realizando restauração do backup", "completed": true, "completed_at": "2026-01-29T00:44:49.646Z"}]	9	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": false, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-01-29T00:43:56.670Z", "content_hash": "v1"}, {"id": "risks_opening", "title": "2. Riscos de Abertura e Vedação", "accepted_at": "2026-01-29T00:43:56.670Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-01-29T00:43:56.670Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-01-29T00:43:56.670Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-01-29T00:43:56.670Z", "content_hash": "v1"}]}, "ip_address": "172.19.0.1", "accepted_at": "2026-01-29T00:43:57.714Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "generated-on-server", "device_fingerprint": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	0	\N	90	2026-01-29 00:45:03.269+00	2026-04-29 00:45:03.269+00	\N	assisted
79ad84e4-04ee-4782-a477-83dac544b04a	2026WF-0005	8132d666-06c0-46a7-b362-a30393be96c0	d33dedeb-804b-4978-9d81-0beef142722e	70c3f5bc-4eee-4cf1-bfc6-5547862b9254	in_progress	180.00	176.00	Bateria com defeito, será necessário fazer a troca da bateria interna	\N	2026-02-24 23:42:05.614186+00	2026-02-25 00:14:27.177968+00	\N	\N	2026-02-25 00:12:17.269+00	\N	\N	\N	2026-02-25 00:12:43.067+00	\N	{}	{}	\N	[{"id": "preset_0_1771978197251", "title": "Abertura Técnica do Equipamento", "completed": true, "completed_at": "2026-02-25T00:13:15.673Z"}, {"id": "preset_1_1771978197251", "title": "Remoção do Componente Antigo", "completed": true, "completed_at": "2026-02-25T00:13:32.072Z"}, {"id": "preset_2_1771978197251", "title": "Instalação da Nova Bateria", "completed": true, "completed_at": "2026-02-25T00:14:27.103Z"}, {"id": "preset_3_1771978197251", "title": "Montagem Final", "completed": false, "completed_at": null}, {"id": "preset_4_1771978197251", "title": "Calibração e Otimização", "completed": false, "completed_at": null}, {"id": "preset_5_1771978197251", "title": "Teste de Eficiência de Carga", "completed": false, "completed_at": null}]	5	{"method": "CLICK_WRAP_V1", "metadata": {"hasParts": true, "signedName": "Click Agreement (No Name)", "acceptedTermsSnapshot": [{"id": "warranty_split", "title": "1. Garantia e Compra Assistida", "accepted_at": "2026-02-25T00:12:10.348Z", "content_hash": "v1"}, {"id": "data_backup", "title": "3. Dados e Backup (LGPD)", "accepted_at": "2026-02-25T00:12:10.348Z", "content_hash": "v1"}, {"id": "abandonment", "title": "4. Política de Abandono", "accepted_at": "2026-02-25T00:12:10.348Z", "content_hash": "v1"}, {"id": "diagnosis_fee", "title": "5. Validade e Taxas", "accepted_at": "2026-02-25T00:12:10.348Z", "content_hash": "v1"}]}, "ip_address": "2804:18:1103:d07e:71a0:56ef:19b8:3b65", "accepted_at": "2026-02-25T00:12:16.807Z", "geolocation": null, "terms_version": "2026.1", "integrity_hash": "497755522ef8d439acaceb071ee96da2ffcd437a62ede4f778f189537243451f", "device_fingerprint": "Mozilla/5.0 (iPhone; CPU iPhone OS 26_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/145.0.7632.108 Mobile/15E148 Safari/604.1"}	\N	\N	\N	\N	\N	\N	\N	\N	\N	[]	Está desligando sozinho	0	\N	90	\N	\N	\N	resale
\.


--
-- Data for Name: schedule_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."schedule_settings" ("id", "user_id", "work_days", "start_time", "end_time", "slot_duration_minutes", "lunch_start", "lunch_end", "max_advance_days", "token_expiry_hours", "created_at", "updated_at") FROM stdin;
e238487a-cd4f-4c21-88cc-9cdd7a372d7a	8132d666-06c0-46a7-b362-a30393be96c0	{1,2,3,4,5,6}	09:00:00	18:00:00	60	12:00:00	13:00:00	30	48	2026-02-20 19:37:49.353107+00	2026-02-21 00:39:47.576461+00
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."schedules" ("id", "user_id", "customer_id", "order_id", "token", "status", "scheduled_date", "scheduled_time", "customer_name", "customer_phone", "notes", "expires_at", "confirmed_at", "created_at", "updated_at", "duration_minutes") FROM stdin;
3b48654d-b301-4fa6-bfae-ff2240b80dc5	8132d666-06c0-46a7-b362-a30393be96c0	\N	\N	2736593fccbe	confirmed	2026-02-25	17:00:00	Leandra	6282726667	\N	2026-02-26 21:52:07.324+00	2026-02-25 02:35:33.002+00	2026-02-24 21:52:07.400379+00	2026-02-25 13:21:33.660865+00	120
ae3c3a4c-9d78-495c-a977-de89e57974cd	8132d666-06c0-46a7-b362-a30393be96c0	\N	\N	787d3aa056b8	canceled	2026-03-04	14:00:00	joao lucas	\N	\N	2026-03-04 22:23:59.609+00	2026-03-02 22:43:04.292+00	2026-03-02 22:23:59.689335+00	2026-03-02 23:01:21.261168+00	120
31de7234-07c2-4ba2-afb8-389cb9b0e91f	8132d666-06c0-46a7-b362-a30393be96c0	\N	\N	399ca6850317	canceled	2026-03-03	09:00:00	Teste	5562991911064	\N	2026-03-04 22:53:45.528+00	2026-03-02 22:54:09.943+00	2026-03-02 22:53:45.614079+00	2026-03-02 23:01:23.142398+00	120
908e1c0c-6c45-4b9c-bc05-4d82c6059d7d	8132d666-06c0-46a7-b362-a30393be96c0	\N	\N	8e139533e1ee	canceled	2026-03-06	14:00:00	joao lucas	5562999913636	\N	2026-03-04 22:54:42.45+00	2026-03-02 22:55:33.271+00	2026-03-02 22:54:42.572932+00	2026-03-02 23:01:24.064774+00	120
\.


--
-- Data for Name: service_catalog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."service_catalog" ("id", "tenant_id", "name", "description", "price_min", "price_max", "category", "active", "created_at", "estimated_time") FROM stdin;
92ef68b3-d755-4a04-9e2e-ef4bfbe66fe1	f0d4c34e-b761-4565-a91e-316c736e9f04	Limpeza Técnica	Desmontagem + Higienização + Pasta Silver.	140.00	220.00	Computadores	t	2026-02-01 23:27:32.271633+00	\N
c5962304-e1f6-42d8-887a-a502a915e8b6	f0d4c34e-b761-4565-a91e-316c736e9f04	Upgrade / Montagem	Instalação física + Otimização de BIOS.	150.00	250.00	Computadores	t	2026-02-01 23:27:32.271633+00	\N
6e3435e9-4bd2-473b-b030-c0cef0ac97ef	f0d4c34e-b761-4565-a91e-316c736e9f04	Manutenção Básica	Limpeza de roletes, sensores e ajustes.	180.00	240.00	Impressoras	t	2026-02-01 23:41:50.397404+00	\N
4edfc7b5-f19d-432e-a43a-2fd94208f266	f0d4c34e-b761-4565-a91e-316c736e9f04	Reparo Mecânico	Unidade de limpeza, bomba e engrenagens.	240.00	320.00	Impressoras	t	2026-02-01 23:41:50.397404+00	\N
54cc151b-2883-4661-9080-5a7bdcc92b53	f0d4c34e-b761-4565-a91e-316c736e9f04	Desobstrução / Reset	Solução química + Pressurização + Software.	220.00	280.00	Impressoras	t	2026-02-01 23:27:32.271633+00	\N
152806c2-1b9c-425f-9a43-a23546c3da7a	8132d666-06c0-46a7-b362-a30393be96c0	Formatação Industrial	Imagem otimizada (Macrium Reflect) + Instalação de Apps Essenciais + Drivers atualizados. Foco em performance.	160.00	240.00	Computadores	t	2026-02-01 23:45:42.478382+00	2h
85aaea01-5c0f-4dc8-984d-34400763338b	8132d666-06c0-46a7-b362-a30393be96c0	Formatação com Backup	Triagem de arquivos, Backup seguro em nuvem/físico + Restauração pós-formatação.	220.00	320.00	Computadores	t	2026-02-01 23:45:42.478382+00	4h
33aabf9d-cfc6-4d72-b005-a2b04d189b4c	8132d666-06c0-46a7-b362-a30393be96c0	Limpeza Técnica	Desmontagem completa, higienização de cooler/dissipador, troca de pasta térmica (Silver) e organização de cabos.	140.00	220.00	Computadores	t	2026-02-01 23:45:42.478382+00	2h
a026cd10-eaff-4e08-9d81-22aaba55ff5a	8132d666-06c0-46a7-b362-a30393be96c0	Upgrade / Montagem	Instalação física de componentes, cable management e otimização de BIOS.	150.00	250.00	Computadores	t	2026-02-01 23:45:42.478382+00	3h
362c6d5d-c932-4821-8fbf-c43e31ee68b0	8132d666-06c0-46a7-b362-a30393be96c0	Manutenção Básica (Impressora)	Limpeza de roletes, sensores e ajustes preventivos.	180.00	240.00	Impressoras	t	2026-02-01 23:45:42.478382+00	24h
39aa89ff-b762-4f59-9ad3-e1577e5d0b72	8132d666-06c0-46a7-b362-a30393be96c0	Reparo Mecânico (Impressora)	Intervenção na unidade de limpeza, bomba e engrenagens.	240.00	320.00	Impressoras	t	2026-02-01 23:45:42.478382+00	48h
be86d1e3-d6df-4507-b54c-496e4fc582b9	8132d666-06c0-46a7-b362-a30393be96c0	Desobstrução / Reset	Solução química para cabeça de impressão + Pressurização + Software.	220.00	280.00	Impressoras	t	2026-02-01 23:45:42.478382+00	48h
c7e011f1-bfde-48b3-a44e-86915083df3b	8132d666-06c0-46a7-b362-a30393be96c0	Visita Técnica / Diagnóstico	Deslocamento e hora técnica para identificação da causa raiz. Valor abatido se o serviço for aprovado.	120.00	200.00	Diagnóstico	t	2026-02-01 23:45:42.478382+00	1h
9f8628e5-8169-4225-a9c5-11e33564ceea	f0d4c34e-b761-4565-a91e-316c736e9f04	Formatação Industrial	Instalação de imagem otimizada com Macrium Reflect, Drivers atualizados e Pacote Office. Foco em performance e estabilidade.	160.00	240.00	Computadores	t	2026-02-01 23:27:32.271633+00	2h
5f9a49d3-231c-4992-ba8e-d1a92266a1c9	f0d4c34e-b761-4565-a91e-316c736e9f04	Formatação com Backup	Triagem completa de arquivos do usuário, Backup seguro em nuvem/físico, Formatação e Restauração dos dados na estrutura original.	220.00	320.00	Computadores	t	2026-02-01 23:27:32.271633+00	4h
5bd2e0c7-45a6-41d3-85df-fe3926357014	f0d4c34e-b761-4565-a91e-316c736e9f04	Visita Técnica / Diagnóstico	Deslocamento técnico até o local e hora técnica para identificação da causa raiz. Valor abatido caso o serviço principal seja aprovado.	70.00	120.00	Diagnóstico	t	2026-02-01 23:27:32.271633+00	1h
ead0bc82-9e82-4ea7-8b78-d7f8511dae49	f0d4c34e-b761-4565-a91e-316c736e9f04	Limpeza Técnica Profunda	Desmontagem completa, higienização química de placa, lubrificação de cooler e troca de Pasta Térmica (Prata/Silver) de alta condutividade.	140.00	220.00	Computadores	t	2026-02-02 00:08:54.02259+00	2h
f8b81b46-7818-485a-bd49-a78305bf623f	f0d4c34e-b761-4565-a91e-316c736e9f04	Upgrade de Hardware / Montagem	Instalação física de componentes (SSD/RAM/GPU), cable management (organização de cabos), otimização de BIOS e testes de stress.	150.00	250.00	Computadores	t	2026-02-02 00:08:54.02259+00	3h
3996cde1-7e4b-4db7-9b30-12071a436a6c	f0d4c34e-b761-4565-a91e-316c736e9f04	Manutenção Corretiva (Jato de Tinta)	Desobstrução de cabeça de impressão, limpeza de dispenser (almofadas), lubrificação de eixo e reset lógico.	240.00	280.00	Impressoras	t	2026-02-02 00:08:54.02259+00	48h
\.


--
-- Data for Name: task_presets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."task_presets" ("id", "user_id", "name", "tasks", "created_at") FROM stdin;
15b97419-d98f-4d58-a960-a3d35d8436a2	8132d666-06c0-46a7-b362-a30393be96c0	Troca de fonte	["Desmontagem e retirada da fonte danificada", "Instalação da nova fonte", "Testes e validação do funcionamento"]	2026-02-19 14:02:26.745594+00
bb054d94-0f04-4707-8da9-bca4110bc245	8132d666-06c0-46a7-b362-a30393be96c0	Limpeza e troca pasta termica - Notebook	["Desmontagem", "Limpeza e troca da pasta termica", "Montagem", "Finalização com testes de temperaturas"]	2026-02-22 19:31:12.628059+00
\.


--
-- Data for Name: technical_reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."technical_reports" ("id", "order_id", "tenant_id", "technical_analysis", "tests_performed", "conclusion", "photos_evidence", "pdf_url", "created_at") FROM stdin;
175619e4-f1a1-4a8b-8b18-f0e3b0d8fa94	0a7f3186-810e-4794-9740-112ce37b1ec4	8132d666-06c0-46a7-b362-a30393be96c0	LAUDO TÉCNICO PERICIAL\n\nIDENTIFICAÇÃO DO ATIVO:\nImpressora HP GT5822\n\nANÁLISE INICIAL & SINTOMAS\nO equipamento apresentou dificuldades no mecanismo de alimentação de papel e obstrução nas mangueiras do reservatório de tinta, resultando em impressões em branco. Além disso, foi relatada a falha de reconhecimento do cartucho colorido e impressões coloridas com ausência da cor magenta.\n\nDIAGNÓSTICO TÉCNICO\nA análise inicial revelou que as mangueiras do reservatório de tinta estavam obstruídas, impedindo o fluxo adequado de tinta, o que resultou em impressões em branco. A troca do cartucho preto foi realizada com sucesso, mas a tentativa de instalação do cartucho colorido falhou devido a problemas de reconhecimento, possivelmente relacionados a contatos elétricos ou firmware. A ausência da cor magenta nas impressões coloridas indica um problema específico no canal de tinta magenta, possivelmente relacionado à obstrução ou falha no cartucho.\n\nMETODOLOGIA DE REPARO APLICADA / PROPOSTA\nFoi realizada a substituição das mangueiras do reservatório de tinta para garantir o fluxo adequado de tinta. O cartucho preto foi trocado com sucesso, restabelecendo a funcionalidade de impressão em preto. Para o cartucho colorido, recomenda-se verificar os contatos elétricos e atualizar o firmware da impressora para resolver a falha de reconhecimento. Adicionalmente, sugere-se a inspeção e possível substituição do cartucho magenta para corrigir a ausência de cor.\n\nCONCLUSÃO E RECOMENDAÇÕES\nApós a intervenção, a impressora apresentou melhorias significativas na alimentação de papel e na impressão em preto, confirmando a eficácia da substituição das mangueiras e do cartucho preto. No entanto, persiste a falha de reconhecimento do cartucho colorido e a ausência da cor magenta. \n\nPara garantir a plena funcionalidade do equipamento, sugere-se a substituição do cartucho colorido e a realização de testes adicionais para validar a correção dos problemas de impressão colorida.	["Impressão"]	Não foi possível instalar novo cartucho colorido e nem efetuar reparo das mangueiras do reservatório de tintas	{https://wddebrieixjcxurtggmb.supabase.co/storage/v1/object/public/os-evidence/0a7f3186-810e-4794-9740-112ce37b1ec4/technical_report/1772055846949_0.jpg,https://wddebrieixjcxurtggmb.supabase.co/storage/v1/object/public/os-evidence/0a7f3186-810e-4794-9740-112ce37b1ec4/technical_report/1772055851768_1.jpg}	\N	2026-02-25 21:47:27.959288+00
\.


--
-- Data for Name: tenant_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."tenant_settings" ("id", "user_id", "trade_name", "legal_document", "phone", "email", "address", "logo_url", "pix_key", "pix_key_type", "mei_limit_annual", "warranty_days_labor", "warranty_days_parts", "created_at", "updated_at") FROM stdin;
ba901cdc-b574-414e-a014-aaefe16e2f1d	f0d4c34e-b761-4565-a91e-316c736e9f04	WTECH Assistência	02331048100	62991911064	wheslancardoso1@gmail.com	{"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 04", "neighborhood": "Irisville"}	\N	02331048100	cpf	81000.00	90	0	2026-01-27 01:37:15.279083+00	2026-01-27 02:47:00.846+00
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."tenants" ("id", "os_prefix", "created_at", "updated_at", "trade_name", "legal_document", "phone", "website", "email", "address", "warranty_days", "logo_url") FROM stdin;
f0d4c34e-b761-4565-a91e-316c736e9f04	WTI	2026-01-27 16:06:49.88352+00	2026-01-29 01:25:26.609+00	Wtech	02331048100	62991911064	\N	wheslancardoso1@gmail.com	{"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 07", "neighborhood": "Irisville"}	180	\N
8132d666-06c0-46a7-b362-a30393be96c0	WF	2026-01-29 02:14:45.65653+00	2026-01-29 23:03:18.779+00	WFIX	023331048100	62994516025	\N	wfixtech.contato@gmail.com	{"zip": "", "city": "Goiânia", "state": "Goiás", "number": "00", "street": "Rua 07", "neighborhood": "Irisville"}	180	\N
\.


--
-- Data for Name: messages_2026_02_28; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_02_28" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: messages_2026_03_01; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_03_01" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: messages_2026_03_02; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_03_02" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: messages_2026_03_03; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_03_03" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: messages_2026_03_04; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_03_04" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: messages_2026_03_05; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_03_05" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: messages_2026_03_06; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."messages_2026_03_06" ("topic", "extension", "payload", "event", "private", "updated_at", "inserted_at", "id") FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."schema_migrations" ("version", "inserted_at") FROM stdin;
20211116024918	2026-01-25 17:01:49
20211116045059	2026-01-25 17:01:49
20211116050929	2026-01-25 17:01:49
20211116051442	2026-01-25 17:01:50
20211116212300	2026-01-25 17:01:50
20211116213355	2026-01-25 17:01:50
20211116213934	2026-01-25 17:01:50
20211116214523	2026-01-25 17:01:50
20211122062447	2026-01-25 19:06:04
20211124070109	2026-01-25 19:06:04
20211202204204	2026-01-25 19:06:04
20211202204605	2026-01-25 19:06:05
20211210212804	2026-01-25 19:06:05
20211228014915	2026-01-25 19:06:05
20220107221237	2026-01-25 19:06:06
20220228202821	2026-01-25 19:06:06
20220312004840	2026-01-25 19:06:06
20220603231003	2026-01-25 19:06:06
20220603232444	2026-01-25 19:06:07
20220615214548	2026-01-25 19:06:07
20220712093339	2026-01-25 19:06:07
20220908172859	2026-01-25 19:06:07
20220916233421	2026-01-25 19:06:07
20230119133233	2026-01-25 19:06:08
20230128025114	2026-01-25 19:06:08
20230128025212	2026-01-25 19:06:08
20230227211149	2026-01-25 19:06:08
20230228184745	2026-01-25 19:06:08
20230308225145	2026-01-25 19:06:09
20230328144023	2026-01-25 19:06:09
20231018144023	2026-01-25 19:06:09
20231204144023	2026-01-25 19:06:09
20231204144024	2026-01-25 19:06:10
20231204144025	2026-01-25 19:06:10
20240108234812	2026-01-25 19:06:10
20240109165339	2026-01-25 19:06:10
20240227174441	2026-01-25 19:06:11
20240311171622	2026-01-25 19:06:11
20240321100241	2026-01-25 19:06:11
20240401105812	2026-01-25 19:06:12
20240418121054	2026-01-25 19:06:12
20240523004032	2026-01-25 19:06:13
20240618124746	2026-01-25 19:06:13
20240801235015	2026-01-25 19:06:13
20240805133720	2026-01-25 19:06:13
20240827160934	2026-01-25 19:06:14
20240919163303	2026-01-25 19:06:14
20240919163305	2026-01-25 19:06:14
20241019105805	2026-01-25 19:06:14
20241030150047	2026-01-25 19:06:15
20241108114728	2026-01-25 19:06:15
20241121104152	2026-01-25 19:06:15
20241130184212	2026-01-25 19:06:16
20241220035512	2026-01-25 19:06:16
20241220123912	2026-01-25 19:06:16
20241224161212	2026-01-25 19:06:16
20250107150512	2026-01-25 19:06:16
20250110162412	2026-01-25 19:06:17
20250123174212	2026-01-25 19:06:17
20250128220012	2026-01-25 19:06:17
20250506224012	2026-01-25 19:06:17
20250523164012	2026-01-25 19:06:17
20250714121412	2026-01-25 19:06:18
20250905041441	2026-01-25 19:06:18
20251103001201	2026-01-25 19:06:18
20251120212548	2026-02-03 22:21:16
20251120215549	2026-02-03 22:21:17
20260218120000	2026-02-27 12:41:33
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY "realtime"."subscription" ("id", "subscription_id", "entity", "filters", "claims", "created_at", "action_filter") FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") FROM stdin;
os-evidence	os-evidence	\N	2026-01-26 20:57:44.815883+00	2026-01-26 20:57:44.815883+00	t	f	\N	\N	\N	STANDARD
order-evidence	order-evidence	\N	2026-01-30 19:29:18.174453+00	2026-01-30 19:29:18.174453+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."buckets_analytics" ("name", "type", "format", "created_at", "updated_at", "id", "deleted_at") FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."buckets_vectors" ("id", "type", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."migrations" ("id", "name", "hash", "executed_at") FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-01-25 17:01:57.779771
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-01-25 17:01:57.79599
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-01-25 17:01:57.824481
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-01-25 17:01:57.835756
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-01-25 17:01:57.840531
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-01-25 17:01:57.851685
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-01-25 17:01:57.856349
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-01-25 17:01:57.872367
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-01-25 17:01:57.877684
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-01-25 17:01:57.882867
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-01-25 17:01:57.887818
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-01-25 17:01:57.911638
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-01-25 17:01:57.916845
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-01-25 17:01:57.921782
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-01-25 17:01:57.926497
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-01-25 17:01:57.93519
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-01-25 17:01:57.939981
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-01-25 17:01:57.946775
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-01-25 17:01:57.961354
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-01-25 17:01:57.971771
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-01-25 17:01:57.977235
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-01-25 17:01:57.982584
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-01-25 17:01:58.518358
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-01-25 17:01:58.566808
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-01-25 17:01:58.572075
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-01-25 17:01:58.585381
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-01-25 17:01:58.590489
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-01-25 17:01:58.610682
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-01-25 17:01:57.801707
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-01-25 17:01:57.845887
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-01-25 17:01:57.861151
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-01-25 17:01:57.866555
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-01-25 17:01:57.988068
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-01-25 17:01:58.002498
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-01-25 17:01:58.461252
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-01-25 17:01:58.467238
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-01-25 17:01:58.473938
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-01-25 17:01:58.481299
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-01-25 17:01:58.48862
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-01-25 17:01:58.496045
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-01-25 17:01:58.498156
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-01-25 17:01:58.504227
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-01-25 17:01:58.509109
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-01-25 17:01:58.52451
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-01-25 17:01:58.535984
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-01-25 17:01:58.541463
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-01-25 17:01:58.549199
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-01-25 17:01:58.554627
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-01-25 17:01:58.56116
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-01-25 17:01:58.595108
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-11 00:55:08.291556
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-11 00:55:08.412527
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-11 00:55:08.414392
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-11 00:55:08.549534
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-11 00:55:08.5524
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-11 00:55:08.554564
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-02-11 00:55:08.569598
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
63e8fea1-06a3-4922-b25f-5e125af54be7	os-evidence	32e76718-e0ba-4c61-a377-12c01dcecd37/checkin/1769482304630_0.jpg	f0d4c34e-b761-4565-a91e-316c736e9f04	2026-01-27 02:51:48.917674+00	2026-01-27 02:51:48.917674+00	2026-01-27 02:51:48.917674+00	{"eTag": "\\"b2e920a92c744d8e647941ee103a7701\\"", "size": 434806, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-27T02:51:49.000Z", "contentLength": 434806, "httpStatusCode": 200}	aa7c98b0-1fbb-4df6-a608-59337a0ece0d	f0d4c34e-b761-4565-a91e-316c736e9f04	{}
300643ce-3fe1-43b3-b930-dea83e03fe7d	os-evidence	32e76718-e0ba-4c61-a377-12c01dcecd37/checkin/1769482377757_0.jpg	f0d4c34e-b761-4565-a91e-316c736e9f04	2026-01-27 02:53:02.784453+00	2026-01-27 02:53:02.784453+00	2026-01-27 02:53:02.784453+00	{"eTag": "\\"b2e920a92c744d8e647941ee103a7701\\"", "size": 434806, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-27T02:53:03.000Z", "contentLength": 434806, "httpStatusCode": 200}	78d92283-742e-403a-9be9-ae559d546228	f0d4c34e-b761-4565-a91e-316c736e9f04	{}
db151a01-7153-4282-913b-898bb656557c	order-evidence	checkin/home-care-1769801500522-rtqbc.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:31:43.802984+00	2026-01-30 19:31:43.802984+00	2026-01-30 19:31:43.802984+00	{"eTag": "\\"6c8b0d4403b5dd11e8cfc0ef7124fa81\\"", "size": 1630111, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:31:44.000Z", "contentLength": 1630111, "httpStatusCode": 200}	490f3f39-92f1-4cf7-a130-a2723c46c2b7	8132d666-06c0-46a7-b362-a30393be96c0	{}
bcdcd849-d093-4459-b068-7184d1054eb6	order-evidence	checkin/home-care-1769801520190-j4ztt.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:32:03.352053+00	2026-01-30 19:32:03.352053+00	2026-01-30 19:32:03.352053+00	{"eTag": "\\"e942fb9a2e1ba56956043618d652d1e0\\"", "size": 1828060, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:32:04.000Z", "contentLength": 1828060, "httpStatusCode": 200}	981fadf8-dc80-41c9-95cf-2b2365a2e4ba	8132d666-06c0-46a7-b362-a30393be96c0	{}
5ea8a92e-717a-4c5a-9741-b9e0321918a5	order-evidence	checkin/home-care-1769801534611-7edwgw.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:32:17.224824+00	2026-01-30 19:32:17.224824+00	2026-01-30 19:32:17.224824+00	{"eTag": "\\"113144a6786cbf3ba2ec683a2f9a92f3\\"", "size": 1484236, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:32:18.000Z", "contentLength": 1484236, "httpStatusCode": 200}	5d4022dd-5551-4525-806f-a6405185bcf8	8132d666-06c0-46a7-b362-a30393be96c0	{}
3d95d94b-06a9-45b2-ae53-38da817f9466	order-evidence	checkin/home-care-1769801551559-ykv7ti.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:32:34.540985+00	2026-01-30 19:32:34.540985+00	2026-01-30 19:32:34.540985+00	{"eTag": "\\"b1e5e8fb9c11a82daeec29bef5588045\\"", "size": 2308259, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:32:34.000Z", "contentLength": 2308259, "httpStatusCode": 200}	5a0130f7-f6d7-482c-8883-3bc72ec0c89d	8132d666-06c0-46a7-b362-a30393be96c0	{}
1ad41931-be2f-40f4-8f4a-96d46cfb2659	order-evidence	checkin/home-care-1769802607763-ie2mu.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:50:11.418526+00	2026-01-30 19:50:11.418526+00	2026-01-30 19:50:11.418526+00	{"eTag": "\\"b33fd7f0f100add3853ad2f8613c752b\\"", "size": 2989443, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:50:12.000Z", "contentLength": 2989443, "httpStatusCode": 200}	61deda1a-78bc-46ff-8b5b-f058ebd8bcc1	8132d666-06c0-46a7-b362-a30393be96c0	{}
564c5a00-0872-42fb-985b-92bc855905e4	order-evidence	checkin/home-care-1769802626828-nf0o6.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:50:30.093448+00	2026-01-30 19:50:30.093448+00	2026-01-30 19:50:30.093448+00	{"eTag": "\\"1eb0cf672937849580f76ceaf1860317\\"", "size": 2454852, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:50:30.000Z", "contentLength": 2454852, "httpStatusCode": 200}	b5e3b750-9eb7-4903-9deb-fcd57f6b2846	8132d666-06c0-46a7-b362-a30393be96c0	{}
2406c36a-90de-46de-b716-e98795557c0b	order-evidence	checkin/home-care-1769802644690-f9wke.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:50:48.102233+00	2026-01-30 19:50:48.102233+00	2026-01-30 19:50:48.102233+00	{"eTag": "\\"40ee9917b64f2b32897f73dd5ac007ba\\"", "size": 3373514, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:50:48.000Z", "contentLength": 3373514, "httpStatusCode": 200}	e8b11faf-3cf0-44b7-b96a-77e57568f965	8132d666-06c0-46a7-b362-a30393be96c0	{}
75058e35-2002-4347-996d-af054a558693	order-evidence	checkin/home-care-1769802656313-j4g97e.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-01-30 19:50:59.538478+00	2026-01-30 19:50:59.538478+00	2026-01-30 19:50:59.538478+00	{"eTag": "\\"ae4278e1875e71f928bf4a4021736c41\\"", "size": 3548338, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-30T19:51:00.000Z", "contentLength": 3548338, "httpStatusCode": 200}	8632169b-2345-4788-9194-4b7f249943dc	8132d666-06c0-46a7-b362-a30393be96c0	{}
d77b0dd7-b11f-49e0-916f-8c1e9337c42b	os-evidence	4c45361f-7af4-4778-85a0-772dc605cc30/technical_report/1769980317244_0.png	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-01 21:11:59.601127+00	2026-02-01 21:11:59.601127+00	2026-02-01 21:11:59.601127+00	{"eTag": "\\"ac9cbaab854e3d7de62e13ce23214ce9\\"", "size": 1209790, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-01T21:12:00.000Z", "contentLength": 1209790, "httpStatusCode": 200}	7ab25199-47c1-47ee-90b1-a69a4eb20ab3	8132d666-06c0-46a7-b362-a30393be96c0	{}
98d69c23-1cb2-4f74-b3cf-0dfe74fe333b	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788010805_0.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:15.645795+00	2026-02-22 19:20:15.645795+00	2026-02-22 19:20:15.645795+00	{"eTag": "\\"ff13be6b4d3f56ac5191e87d69aa902b\\"", "size": 316826, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:16.000Z", "contentLength": 316826, "httpStatusCode": 200}	90c56a5a-4dd4-4048-b8a6-bdfbe4a23313	8132d666-06c0-46a7-b362-a30393be96c0	{}
e0e95f3d-92e2-47fd-80cf-6662dbca65b7	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788013464_1.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:17.197821+00	2026-02-22 19:20:17.197821+00	2026-02-22 19:20:17.197821+00	{"eTag": "\\"66bed4f2209fd6a58a492f68db17b7a9\\"", "size": 266518, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:18.000Z", "contentLength": 266518, "httpStatusCode": 200}	e06d10b2-cb9c-447d-b9b9-66f85a235104	8132d666-06c0-46a7-b362-a30393be96c0	{}
1776d339-bf8f-4af8-891f-d2110555c2a6	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788014946_2.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:18.599444+00	2026-02-22 19:20:18.599444+00	2026-02-22 19:20:18.599444+00	{"eTag": "\\"b8107815e59d2ff369102440c4b33468\\"", "size": 173024, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:19.000Z", "contentLength": 173024, "httpStatusCode": 200}	75430584-ff98-4b4e-ba61-9e84dd1bdc10	8132d666-06c0-46a7-b362-a30393be96c0	{}
34e1eba3-4c00-42bf-b7c0-eb2f816ee3f6	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788016358_3.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:20.114835+00	2026-02-22 19:20:20.114835+00	2026-02-22 19:20:20.114835+00	{"eTag": "\\"64c812562f696312c48e17b5588d217f\\"", "size": 197132, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:21.000Z", "contentLength": 197132, "httpStatusCode": 200}	57fd7216-663c-446b-9f50-e2c8b2be0cf5	8132d666-06c0-46a7-b362-a30393be96c0	{}
4903a07f-aa5e-49ff-8ee7-31e8e9c65f4d	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788017983_4.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:21.781231+00	2026-02-22 19:20:21.781231+00	2026-02-22 19:20:21.781231+00	{"eTag": "\\"0c4cbb0248226e49f3b2517b5acb4dd0\\"", "size": 364010, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:22.000Z", "contentLength": 364010, "httpStatusCode": 200}	47354538-4534-46c9-b290-9df3405b628d	8132d666-06c0-46a7-b362-a30393be96c0	{}
98293880-b364-4056-8c76-81e52208eddd	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788019589_5.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:23.419171+00	2026-02-22 19:20:23.419171+00	2026-02-22 19:20:23.419171+00	{"eTag": "\\"a1da34324a0a8975de83219dcdcf4da6\\"", "size": 374728, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:24.000Z", "contentLength": 374728, "httpStatusCode": 200}	3f268e65-7337-46af-b8a7-fad75adbb069	8132d666-06c0-46a7-b362-a30393be96c0	{}
e90032c2-e6bd-443a-b635-557c2e25430a	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788021387_6.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:26.214998+00	2026-02-22 19:20:26.214998+00	2026-02-22 19:20:26.214998+00	{"eTag": "\\"08643eb50c2ec4ba8b07fbc7a60c6650\\"", "size": 480110, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:27.000Z", "contentLength": 480110, "httpStatusCode": 200}	9796ebce-d8d6-429f-8d68-8431f18d9a09	8132d666-06c0-46a7-b362-a30393be96c0	{}
3697f4b7-db10-4cf3-9714-e46f67b30871	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkin/1771788023975_7.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:20:27.675746+00	2026-02-22 19:20:27.675746+00	2026-02-22 19:20:27.675746+00	{"eTag": "\\"26b46cec9264e0e80caa815278c09fb5\\"", "size": 193538, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:20:28.000Z", "contentLength": 193538, "httpStatusCode": 200}	8cc44da8-4e9d-4b7e-853b-c51f85ecb797	8132d666-06c0-46a7-b362-a30393be96c0	{}
197d60a1-0b09-4cdf-8f80-8d4324a2cbc2	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/checkout/1771789059940_0.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:37:44.164099+00	2026-02-22 19:37:44.164099+00	2026-02-22 19:37:44.164099+00	{"eTag": "\\"901f3aa2bece6a6c4cbe5202934f1685\\"", "size": 418296, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:37:45.000Z", "contentLength": 418296, "httpStatusCode": 200}	d5b71595-6c2d-4728-93fb-3cb96539fa74	8132d666-06c0-46a7-b362-a30393be96c0	{}
95efb22e-6fb8-46dc-8e46-5eb99aefabd9	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/technical_report/1771790127950_0.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:55:31.779658+00	2026-02-22 19:55:31.779658+00	2026-02-22 19:55:31.779658+00	{"eTag": "\\"da4593e008787d63fc19378b586291e0\\"", "size": 36702, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:55:32.000Z", "contentLength": 36702, "httpStatusCode": 200}	f4280948-b8bf-4662-b872-de2957ed2898	8132d666-06c0-46a7-b362-a30393be96c0	{}
e64e6635-2174-46a0-9635-3802747f5db0	os-evidence	1a079cda-8168-4a52-aabc-0e6c9c4932a7/technical_report/1771790129095_1.webp	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 19:55:32.651565+00	2026-02-22 19:55:32.651565+00	2026-02-22 19:55:32.651565+00	{"eTag": "\\"f3e28ead760dd1ea959e43ff5817acb7\\"", "size": 40382, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T19:55:33.000Z", "contentLength": 40382, "httpStatusCode": 200}	b4422cd9-e44e-48a4-bd2e-a0b0344e1a96	8132d666-06c0-46a7-b362-a30393be96c0	{}
4641f364-24ef-4dc1-b319-4e152b7b174e	order-evidence	checkin/home-care-1771800054818-4k84e9.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 22:40:59.266548+00	2026-02-22 22:40:59.266548+00	2026-02-22 22:40:59.266548+00	{"eTag": "\\"baf41edb23d2827dfa85a8669bd46c08\\"", "size": 62654, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T22:41:00.000Z", "contentLength": 62654, "httpStatusCode": 200}	7fe739da-23ee-4f41-bcd8-eb6e669c2d86	8132d666-06c0-46a7-b362-a30393be96c0	{}
e2dc43e6-2939-4e4f-b68d-068efc011d83	order-evidence	checkin/home-care-1771800060882-vvgwyr.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 22:41:04.868336+00	2026-02-22 22:41:04.868336+00	2026-02-22 22:41:04.868336+00	{"eTag": "\\"9deb92841e75ee21cd74b6560355bd05\\"", "size": 92578, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T22:41:05.000Z", "contentLength": 92578, "httpStatusCode": 200}	73a8061e-ee34-4542-afe1-fadddaf0c6a5	8132d666-06c0-46a7-b362-a30393be96c0	{}
e87e796d-5e99-4b68-a853-0605a7244ed2	order-evidence	checkin/home-care-1771800064401-n2olk9.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 22:41:08.15907+00	2026-02-22 22:41:08.15907+00	2026-02-22 22:41:08.15907+00	{"eTag": "\\"73c2a6d5c27c5f42ba9794dbcbdb568e\\"", "size": 58416, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T22:41:09.000Z", "contentLength": 58416, "httpStatusCode": 200}	b5519ce4-141c-4f50-863c-97cfd7cebfaa	8132d666-06c0-46a7-b362-a30393be96c0	{}
f2632f90-1647-4a65-af86-483321e2ce9c	order-evidence	checkin/home-care-1771800076040-bp7g8w.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-22 22:41:20.510516+00	2026-02-22 22:41:20.510516+00	2026-02-22 22:41:20.510516+00	{"eTag": "\\"46765ce3b62cd07005392fd377400039\\"", "size": 103586, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-22T22:41:21.000Z", "contentLength": 103586, "httpStatusCode": 200}	99e5b45e-4865-4913-8639-2c297abec67e	8132d666-06c0-46a7-b362-a30393be96c0	{}
27d8ce14-3afe-4b79-8369-abbff890daaa	order-evidence	checkin/home-care-1771808441306-yrry7b.jpeg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-23 01:00:45.650122+00	2026-02-23 01:00:45.650122+00	2026-02-23 01:00:45.650122+00	{"eTag": "\\"24248a3229d99e6241e0f446ba067896\\"", "size": 168499, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-23T01:00:46.000Z", "contentLength": 168499, "httpStatusCode": 200}	d106dd8f-2211-4b1c-9674-bf4c0ea3563e	8132d666-06c0-46a7-b362-a30393be96c0	{}
fbada915-d5d4-4d57-bc56-8b82abfe3a28	order-evidence	checkin/home-care-1771808445275-idk2qw.jpeg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-23 01:00:51.037428+00	2026-02-23 01:00:51.037428+00	2026-02-23 01:00:51.037428+00	{"eTag": "\\"03013546bf698a771fec6c0cb2ac586c\\"", "size": 127238, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-23T01:00:51.000Z", "contentLength": 127238, "httpStatusCode": 200}	3a64ebf1-c88d-4524-aee8-d7a6904aaae7	8132d666-06c0-46a7-b362-a30393be96c0	{}
1fc316ce-6ab5-4146-ac72-c1598b12ea05	order-evidence	checkin/home-care-1771808451495-i19n4.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-23 01:00:55.696959+00	2026-02-23 01:00:55.696959+00	2026-02-23 01:00:55.696959+00	{"eTag": "\\"e4fec1dba0ae1fbffdcab74e49a5197e\\"", "size": 103325, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-23T01:00:56.000Z", "contentLength": 103325, "httpStatusCode": 200}	5140aa71-b390-4a98-9eb1-1fedbd3b16ff	8132d666-06c0-46a7-b362-a30393be96c0	{}
4f6495c1-b0fa-4b96-9f13-e397e43e750d	order-evidence	checkin/home-care-1771808458815-f4ck7.jpeg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-23 01:01:03.446214+00	2026-02-23 01:01:03.446214+00	2026-02-23 01:01:03.446214+00	{"eTag": "\\"1091b470d22ba842c572e6ef6820aec5\\"", "size": 103740, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-23T01:01:04.000Z", "contentLength": 103740, "httpStatusCode": 200}	8d30a97f-6d18-4a1c-8017-5d4f55ae219c	8132d666-06c0-46a7-b362-a30393be96c0	{}
d3f37baa-2c01-40c2-b44d-d0cb8bf614be	order-evidence	checkin/home-care-1771808485728-7kg4k7.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-23 01:01:32.564155+00	2026-02-23 01:01:32.564155+00	2026-02-23 01:01:32.564155+00	{"eTag": "\\"4f633da51fb24c6cd2329756581d2e7c\\"", "size": 243345, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-23T01:01:33.000Z", "contentLength": 243345, "httpStatusCode": 200}	730cf911-cdb3-4579-b227-20086884bb39	8132d666-06c0-46a7-b362-a30393be96c0	{}
ff2a21a4-db80-4c75-b5c3-3b5d27660e8c	os-evidence	0a7f3186-810e-4794-9740-112ce37b1ec4/technical_report/1772055121612_1.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-25 21:32:03.032069+00	2026-02-25 21:32:03.032069+00	2026-02-25 21:32:03.032069+00	{"eTag": "\\"a3323089f475c9383458bbb48483c05e\\"", "size": 344236, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T21:32:03.000Z", "contentLength": 344236, "httpStatusCode": 200}	f5cb17d5-dd18-42e5-a8dd-cf36d5804991	8132d666-06c0-46a7-b362-a30393be96c0	{}
6055314d-1098-4b0a-8d16-bfca53f4e2ff	os-evidence	0a7f3186-810e-4794-9740-112ce37b1ec4/technical_report/1772055846949_0.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-25 21:44:10.823939+00	2026-02-25 21:44:10.823939+00	2026-02-25 21:44:10.823939+00	{"eTag": "\\"883306a1d142240e8f5eb030679eaded\\"", "size": 344549, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T21:44:11.000Z", "contentLength": 344549, "httpStatusCode": 200}	56b462d1-d895-4f2e-91b4-775175ac69cc	8132d666-06c0-46a7-b362-a30393be96c0	{}
12c1c59e-1099-4b36-b7f2-6228bd337107	os-evidence	0a7f3186-810e-4794-9740-112ce37b1ec4/technical_report/1772055851768_1.jpg	8132d666-06c0-46a7-b362-a30393be96c0	2026-02-25 21:44:14.802937+00	2026-02-25 21:44:14.802937+00	2026-02-25 21:44:14.802937+00	{"eTag": "\\"ea35d0df6d21410c066878f0af061198\\"", "size": 319596, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-25T21:44:15.000Z", "contentLength": 319596, "httpStatusCode": 200}	e3909b2d-3df3-471c-b731-7ff9ccc20ea9	8132d666-06c0-46a7-b362-a30393be96c0	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY "storage"."vector_indexes" ("id", "name", "bucket_id", "data_type", "dimension", "distance_metric", "metadata_configuration", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: -
--

COPY "supabase_functions"."hooks" ("id", "hook_table_id", "hook_name", "created_at", "request_id") FROM stdin;
1	45259	enviar_lembrete_n8n	2026-02-26 22:16:26.565761+00	9
2	45259	enviar_lembrete_n8n	2026-02-26 22:16:53.285641+00	11
3	45259	enviar_lembrete_n8n	2026-02-27 01:45:49.383489+00	13
4	45259	enviar_lembrete_n8n	2026-02-27 03:17:58.658745+00	19
5	45259	enviar_lembrete_n8n	2026-02-27 03:37:48.321329+00	20
6	45259	enviar_lembrete_n8n	2026-02-27 03:44:43.988656+00	21
7	45259	enviar_lembrete_n8n	2026-02-27 12:41:58.068902+00	24
8	45259	enviar_lembrete_n8n	2026-02-28 00:45:25.343413+00	25
9	45259	enviar_lembrete_n8n	2026-02-28 00:58:58.969346+00	27
10	45259	enviar_lembrete_n8n	2026-02-28 01:00:31.896989+00	29
11	45259	enviar_lembrete_n8n	2026-02-28 01:01:04.384492+00	30
12	45259	enviar_lembrete_n8n	2026-02-28 01:02:55.802078+00	32
13	45259	enviar_lembrete_n8n	2026-02-28 01:04:59.742567+00	34
14	45259	enviar_lembrete_n8n	2026-02-28 01:05:41.522605+00	35
15	45259	enviar_lembrete_n8n	2026-02-28 01:24:46.27078+00	36
16	45259	enviar_lembrete_n8n	2026-02-28 01:30:13.559268+00	38
17	45259	enviar_lembrete_n8n	2026-02-28 01:32:58.729869+00	40
18	45259	enviar_lembrete_n8n	2026-02-28 02:18:13.900389+00	42
19	45259	enviar_lembrete_n8n	2026-02-28 02:24:21.563182+00	44
20	45259	enviar_lembrete_n8n	2026-02-28 02:40:56.232638+00	46
21	45259	enviar_lembrete_n8n	2026-02-28 02:42:51.003634+00	48
22	45259	enviar_lembrete_n8n	2026-02-28 02:42:53.863256+00	49
23	45259	enviar_lembrete_n8n	2026-02-28 02:42:56.131072+00	50
24	45259	enviar_lembrete_n8n	2026-02-28 02:42:56.903342+00	51
25	45259	enviar_lembrete_n8n	2026-02-28 02:42:58.157483+00	52
26	45259	enviar_lembrete_n8n	2026-02-28 02:42:59.11278+00	53
27	45259	enviar_lembrete_n8n	2026-02-28 02:43:00.085608+00	54
28	45259	enviar_lembrete_n8n	2026-02-28 02:43:00.924222+00	55
29	45259	enviar_lembrete_n8n	2026-02-28 02:43:01.551679+00	56
30	45259	enviar_lembrete_n8n	2026-02-28 02:43:02.414868+00	57
31	45259	enviar_lembrete_n8n	2026-02-28 02:43:02.991527+00	58
32	45259	enviar_lembrete_n8n	2026-02-28 02:43:03.588576+00	59
33	45259	enviar_lembrete_n8n	2026-02-28 02:43:04.152379+00	60
34	45259	enviar_lembrete_n8n	2026-02-28 19:38:56.280137+00	62
35	45259	enviar_lembrete_n8n	2026-02-28 19:38:59.330019+00	63
36	45259	enviar_lembrete_n8n	2026-02-28 19:39:01.909789+00	64
37	45259	enviar_lembrete_n8n	2026-03-02 22:24:03.747143+00	67
38	45259	enviar_lembrete_n8n	2026-03-02 22:43:04.610749+00	68
39	45259	enviar_lembrete_n8n	2026-03-02 22:54:10.047751+00	70
40	45259	enviar_lembrete_n8n	2026-03-02 22:55:33.626315+00	72
41	45259	enviar_lembrete_n8n	2026-03-02 23:01:21.261168+00	74
42	45259	enviar_lembrete_n8n	2026-03-02 23:01:23.142398+00	75
43	45259	enviar_lembrete_n8n	2026-03-02 23:01:24.064774+00	76
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: -
--

COPY "supabase_functions"."migrations" ("version", "inserted_at") FROM stdin;
initial	2026-02-26 21:05:30.948654+00
20210809183423_update_grants	2026-02-26 21:05:30.948654+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: -
--

COPY "supabase_migrations"."schema_migrations" ("version", "statements", "name") FROM stdin;
20260129201500	{"-- Migration to add remote access fields to equipments table\nALTER TABLE equipments \nADD COLUMN IF NOT EXISTS remote_access_id TEXT DEFAULT NULL,\nADD COLUMN IF NOT EXISTS remote_access_password TEXT DEFAULT NULL","-- Comment on columns for clarity\nCOMMENT ON COLUMN equipments.serial_number IS 'Serial Number or Service Tag of the equipment'","COMMENT ON COLUMN equipments.remote_access_id IS 'ID for remote access (e.g. AnyDesk, TeamViewer)'","COMMENT ON COLUMN equipments.remote_access_password IS 'Password for remote access (should be treated with care)'"}	add_remote_access_fields
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY "vault"."secrets" ("id", "name", "description", "secret", "key_id", "nonce", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 255, true);


--
-- Name: jobid_seq; Type: SEQUENCE SET; Schema: cron; Owner: -
--

SELECT pg_catalog.setval('"cron"."jobid_seq"', 3, true);


--
-- Name: runid_seq; Type: SEQUENCE SET; Schema: cron; Owner: -
--

SELECT pg_catalog.setval('"cron"."runid_seq"', 5, true);


--
-- Name: orders_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."orders_display_id_seq"', 9, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('"realtime"."subscription_id_seq"', 350, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: -
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 43, true);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "amr_id_pk" PRIMARY KEY ("id");


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."audit_log_entries"
    ADD CONSTRAINT "audit_log_entries_pkey" PRIMARY KEY ("id");


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."flow_state"
    ADD CONSTRAINT "flow_state_pkey" PRIMARY KEY ("id");


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_pkey" PRIMARY KEY ("id");


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_provider_id_provider_unique" UNIQUE ("provider_id", "provider");


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."instances"
    ADD CONSTRAINT "instances_pkey" PRIMARY KEY ("id");


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "mfa_amr_claims_session_id_authentication_method_pkey" UNIQUE ("session_id", "authentication_method");


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_challenges"
    ADD CONSTRAINT "mfa_challenges_pkey" PRIMARY KEY ("id");


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_last_challenged_at_key" UNIQUE ("last_challenged_at");


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_pkey" PRIMARY KEY ("id");


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_authorizations"
    ADD CONSTRAINT "oauth_authorizations_authorization_code_key" UNIQUE ("authorization_code");


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_authorizations"
    ADD CONSTRAINT "oauth_authorizations_authorization_id_key" UNIQUE ("authorization_id");


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_authorizations"
    ADD CONSTRAINT "oauth_authorizations_pkey" PRIMARY KEY ("id");


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_client_states"
    ADD CONSTRAINT "oauth_client_states_pkey" PRIMARY KEY ("id");


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_clients"
    ADD CONSTRAINT "oauth_clients_pkey" PRIMARY KEY ("id");


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_consents"
    ADD CONSTRAINT "oauth_consents_pkey" PRIMARY KEY ("id");


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_consents"
    ADD CONSTRAINT "oauth_consents_user_client_unique" UNIQUE ("user_id", "client_id");


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."one_time_tokens"
    ADD CONSTRAINT "one_time_tokens_pkey" PRIMARY KEY ("id");


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY ("id");


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_token_unique" UNIQUE ("token");


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_entity_id_key" UNIQUE ("entity_id");


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_pkey" PRIMARY KEY ("id");


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_pkey" PRIMARY KEY ("id");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."sso_domains"
    ADD CONSTRAINT "sso_domains_pkey" PRIMARY KEY ("id");


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."sso_providers"
    ADD CONSTRAINT "sso_providers_pkey" PRIMARY KEY ("id");


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."users"
    ADD CONSTRAINT "users_phone_key" UNIQUE ("phone");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "customers_pkey" PRIMARY KEY ("id");


--
-- Name: equipments equipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."equipments"
    ADD CONSTRAINT "equipments_pkey" PRIMARY KEY ("id");


--
-- Name: follow_ups follow_ups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."follow_ups"
    ADD CONSTRAINT "follow_ups_pkey" PRIMARY KEY ("id");


--
-- Name: hardware_telemetry hardware_telemetry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."hardware_telemetry"
    ADD CONSTRAINT "hardware_telemetry_pkey" PRIMARY KEY ("id");


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."leads"
    ADD CONSTRAINT "leads_pkey" PRIMARY KEY ("id");


--
-- Name: nps_feedbacks nps_feedbacks_discount_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."nps_feedbacks"
    ADD CONSTRAINT "nps_feedbacks_discount_code_key" UNIQUE ("discount_code");


--
-- Name: nps_feedbacks nps_feedbacks_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."nps_feedbacks"
    ADD CONSTRAINT "nps_feedbacks_order_id_key" UNIQUE ("order_id");


--
-- Name: nps_feedbacks nps_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."nps_feedbacks"
    ADD CONSTRAINT "nps_feedbacks_pkey" PRIMARY KEY ("id");


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_pkey" PRIMARY KEY ("id");


--
-- Name: order_logs order_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."order_logs"
    ADD CONSTRAINT "order_logs_pkey" PRIMARY KEY ("id");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");


--
-- Name: schedule_settings schedule_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedule_settings"
    ADD CONSTRAINT "schedule_settings_pkey" PRIMARY KEY ("id");


--
-- Name: schedule_settings schedule_settings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedule_settings"
    ADD CONSTRAINT "schedule_settings_user_id_key" UNIQUE ("user_id");


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedules"
    ADD CONSTRAINT "schedules_pkey" PRIMARY KEY ("id");


--
-- Name: schedules schedules_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedules"
    ADD CONSTRAINT "schedules_token_key" UNIQUE ("token");


--
-- Name: service_catalog service_catalog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."service_catalog"
    ADD CONSTRAINT "service_catalog_pkey" PRIMARY KEY ("id");


--
-- Name: task_presets task_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_presets"
    ADD CONSTRAINT "task_presets_pkey" PRIMARY KEY ("id");


--
-- Name: technical_reports technical_reports_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."technical_reports"
    ADD CONSTRAINT "technical_reports_order_id_key" UNIQUE ("order_id");


--
-- Name: technical_reports technical_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."technical_reports"
    ADD CONSTRAINT "technical_reports_pkey" PRIMARY KEY ("id");


--
-- Name: tenant_settings tenant_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tenant_settings"
    ADD CONSTRAINT "tenant_settings_pkey" PRIMARY KEY ("id");


--
-- Name: tenant_settings tenant_settings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tenant_settings"
    ADD CONSTRAINT "tenant_settings_user_id_key" UNIQUE ("user_id");


--
-- Name: tenants tenants_os_prefix_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tenants"
    ADD CONSTRAINT "tenants_os_prefix_key" UNIQUE ("os_prefix");


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tenants"
    ADD CONSTRAINT "tenants_pkey" PRIMARY KEY ("id");


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages"
    ADD CONSTRAINT "messages_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_02_28 messages_2026_02_28_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_02_28"
    ADD CONSTRAINT "messages_2026_02_28_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_03_01 messages_2026_03_01_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_03_01"
    ADD CONSTRAINT "messages_2026_03_01_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_03_02 messages_2026_03_02_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_03_02"
    ADD CONSTRAINT "messages_2026_03_02_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_03_03 messages_2026_03_03_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_03_03"
    ADD CONSTRAINT "messages_2026_03_03_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_03_04 messages_2026_03_04_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_03_04"
    ADD CONSTRAINT "messages_2026_03_04_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_03_05 messages_2026_03_05_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_03_05"
    ADD CONSTRAINT "messages_2026_03_05_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: messages_2026_03_06 messages_2026_03_06_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."messages_2026_03_06"
    ADD CONSTRAINT "messages_2026_03_06_pkey" PRIMARY KEY ("id", "inserted_at");


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."subscription"
    ADD CONSTRAINT "pk_subscription" PRIMARY KEY ("id");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY "realtime"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."buckets_analytics"
    ADD CONSTRAINT "buckets_analytics_pkey" PRIMARY KEY ("id");


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."buckets"
    ADD CONSTRAINT "buckets_pkey" PRIMARY KEY ("id");


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."buckets_vectors"
    ADD CONSTRAINT "buckets_vectors_pkey" PRIMARY KEY ("id");


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."migrations"
    ADD CONSTRAINT "migrations_name_key" UNIQUE ("name");


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_pkey" PRIMARY KEY ("id");


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."s3_multipart_uploads_parts"
    ADD CONSTRAINT "s3_multipart_uploads_parts_pkey" PRIMARY KEY ("id");


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."s3_multipart_uploads"
    ADD CONSTRAINT "s3_multipart_uploads_pkey" PRIMARY KEY ("id");


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."vector_indexes"
    ADD CONSTRAINT "vector_indexes_pkey" PRIMARY KEY ("id");


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY "supabase_functions"."hooks"
    ADD CONSTRAINT "hooks_pkey" PRIMARY KEY ("id");


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: -
--

ALTER TABLE ONLY "supabase_functions"."migrations"
    ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("version");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: -
--

ALTER TABLE ONLY "supabase_migrations"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "audit_logs_instance_id_idx" ON "auth"."audit_log_entries" USING "btree" ("instance_id");


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "confirmation_token_idx" ON "auth"."users" USING "btree" ("confirmation_token") WHERE (("confirmation_token")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "email_change_token_current_idx" ON "auth"."users" USING "btree" ("email_change_token_current") WHERE (("email_change_token_current")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "email_change_token_new_idx" ON "auth"."users" USING "btree" ("email_change_token_new") WHERE (("email_change_token_new")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "factor_id_created_at_idx" ON "auth"."mfa_factors" USING "btree" ("user_id", "created_at");


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "flow_state_created_at_idx" ON "auth"."flow_state" USING "btree" ("created_at" DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "identities_email_idx" ON "auth"."identities" USING "btree" ("email" "text_pattern_ops");


--
-- Name: INDEX "identities_email_idx"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX "auth"."identities_email_idx" IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "identities_user_id_idx" ON "auth"."identities" USING "btree" ("user_id");


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "idx_auth_code" ON "auth"."flow_state" USING "btree" ("auth_code");


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "idx_oauth_client_states_created_at" ON "auth"."oauth_client_states" USING "btree" ("created_at");


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "idx_user_id_auth_method" ON "auth"."flow_state" USING "btree" ("user_id", "authentication_method");


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "mfa_challenge_created_at_idx" ON "auth"."mfa_challenges" USING "btree" ("created_at" DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "mfa_factors_user_friendly_name_unique" ON "auth"."mfa_factors" USING "btree" ("friendly_name", "user_id") WHERE (TRIM(BOTH FROM "friendly_name") <> ''::"text");


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "mfa_factors_user_id_idx" ON "auth"."mfa_factors" USING "btree" ("user_id");


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "oauth_auth_pending_exp_idx" ON "auth"."oauth_authorizations" USING "btree" ("expires_at") WHERE ("status" = 'pending'::"auth"."oauth_authorization_status");


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "oauth_clients_deleted_at_idx" ON "auth"."oauth_clients" USING "btree" ("deleted_at");


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "oauth_consents_active_client_idx" ON "auth"."oauth_consents" USING "btree" ("client_id") WHERE ("revoked_at" IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "oauth_consents_active_user_client_idx" ON "auth"."oauth_consents" USING "btree" ("user_id", "client_id") WHERE ("revoked_at" IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "oauth_consents_user_order_idx" ON "auth"."oauth_consents" USING "btree" ("user_id", "granted_at" DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "one_time_tokens_relates_to_hash_idx" ON "auth"."one_time_tokens" USING "hash" ("relates_to");


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "one_time_tokens_token_hash_hash_idx" ON "auth"."one_time_tokens" USING "hash" ("token_hash");


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "one_time_tokens_user_id_token_type_key" ON "auth"."one_time_tokens" USING "btree" ("user_id", "token_type");


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "reauthentication_token_idx" ON "auth"."users" USING "btree" ("reauthentication_token") WHERE (("reauthentication_token")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "recovery_token_idx" ON "auth"."users" USING "btree" ("recovery_token") WHERE (("recovery_token")::"text" !~ '^[0-9 ]*$'::"text");


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "refresh_tokens_instance_id_idx" ON "auth"."refresh_tokens" USING "btree" ("instance_id");


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "refresh_tokens_instance_id_user_id_idx" ON "auth"."refresh_tokens" USING "btree" ("instance_id", "user_id");


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "refresh_tokens_parent_idx" ON "auth"."refresh_tokens" USING "btree" ("parent");


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "refresh_tokens_session_id_revoked_idx" ON "auth"."refresh_tokens" USING "btree" ("session_id", "revoked");


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "refresh_tokens_updated_at_idx" ON "auth"."refresh_tokens" USING "btree" ("updated_at" DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "saml_providers_sso_provider_id_idx" ON "auth"."saml_providers" USING "btree" ("sso_provider_id");


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "saml_relay_states_created_at_idx" ON "auth"."saml_relay_states" USING "btree" ("created_at" DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "saml_relay_states_for_email_idx" ON "auth"."saml_relay_states" USING "btree" ("for_email");


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "saml_relay_states_sso_provider_id_idx" ON "auth"."saml_relay_states" USING "btree" ("sso_provider_id");


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "sessions_not_after_idx" ON "auth"."sessions" USING "btree" ("not_after" DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "sessions_oauth_client_id_idx" ON "auth"."sessions" USING "btree" ("oauth_client_id");


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "sessions_user_id_idx" ON "auth"."sessions" USING "btree" ("user_id");


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "sso_domains_domain_idx" ON "auth"."sso_domains" USING "btree" ("lower"("domain"));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "sso_domains_sso_provider_id_idx" ON "auth"."sso_domains" USING "btree" ("sso_provider_id");


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "sso_providers_resource_id_idx" ON "auth"."sso_providers" USING "btree" ("lower"("resource_id"));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "sso_providers_resource_id_pattern_idx" ON "auth"."sso_providers" USING "btree" ("resource_id" "text_pattern_ops");


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "unique_phone_factor_per_user" ON "auth"."mfa_factors" USING "btree" ("user_id", "phone");


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "user_id_created_at_idx" ON "auth"."sessions" USING "btree" ("user_id", "created_at");


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX "users_email_partial_key" ON "auth"."users" USING "btree" ("email") WHERE ("is_sso_user" = false);


--
-- Name: INDEX "users_email_partial_key"; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX "auth"."users_email_partial_key" IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "users_instance_id_email_idx" ON "auth"."users" USING "btree" ("instance_id", "lower"(("email")::"text"));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "users_instance_id_idx" ON "auth"."users" USING "btree" ("instance_id");


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX "users_is_anonymous_idx" ON "auth"."users" USING "btree" ("is_anonymous");


--
-- Name: idx_customers_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_customers_user_id" ON "public"."customers" USING "btree" ("user_id");


--
-- Name: idx_equipments_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_equipments_customer_id" ON "public"."equipments" USING "btree" ("customer_id");


--
-- Name: idx_follow_ups_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_follow_ups_order" ON "public"."follow_ups" USING "btree" ("order_id");


--
-- Name: idx_follow_ups_scheduled; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_follow_ups_scheduled" ON "public"."follow_ups" USING "btree" ("scheduled_for");


--
-- Name: idx_follow_ups_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_follow_ups_status" ON "public"."follow_ups" USING "btree" ("status");


--
-- Name: idx_leads_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_leads_created_at" ON "public"."leads" USING "btree" ("created_at" DESC);


--
-- Name: idx_leads_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_leads_status" ON "public"."leads" USING "btree" ("status");


--
-- Name: idx_leads_tenant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_leads_tenant_id" ON "public"."leads" USING "btree" ("tenant_id");


--
-- Name: idx_nps_feedbacks_google_clicks; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_nps_feedbacks_google_clicks" ON "public"."nps_feedbacks" USING "btree" ("clicked_google_review") WHERE ("clicked_google_review" = true);


--
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_order_items_order_id" ON "public"."order_items" USING "btree" ("order_id");


--
-- Name: idx_order_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_order_logs_created_at" ON "public"."order_logs" USING "btree" ("created_at" DESC);


--
-- Name: idx_order_logs_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_order_logs_order_id" ON "public"."order_logs" USING "btree" ("order_id");


--
-- Name: idx_orders_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_created_at" ON "public"."orders" USING "btree" ("created_at" DESC);


--
-- Name: idx_orders_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_customer_id" ON "public"."orders" USING "btree" ("customer_id");


--
-- Name: idx_orders_display_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "idx_orders_display_id_unique" ON "public"."orders" USING "btree" ("user_id", "display_id");


--
-- Name: idx_orders_equipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_equipment_id" ON "public"."orders" USING "btree" ("equipment_id");


--
-- Name: idx_orders_execution_tasks; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_execution_tasks" ON "public"."orders" USING "gin" ("execution_tasks");


--
-- Name: idx_orders_integrity_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_integrity_hash" ON "public"."orders" USING "btree" ("integrity_hash");


--
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_status" ON "public"."orders" USING "btree" ("status");


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_user_id" ON "public"."orders" USING "btree" ("user_id");


--
-- Name: idx_orders_warranty_end; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_orders_warranty_end" ON "public"."orders" USING "btree" ("warranty_end_date") WHERE ("warranty_end_date" IS NOT NULL);


--
-- Name: idx_schedules_scheduled_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_schedules_scheduled_date" ON "public"."schedules" USING "btree" ("scheduled_date");


--
-- Name: idx_schedules_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_schedules_status" ON "public"."schedules" USING "btree" ("status");


--
-- Name: idx_schedules_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_schedules_token" ON "public"."schedules" USING "btree" ("token");


--
-- Name: idx_schedules_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_schedules_user_id" ON "public"."schedules" USING "btree" ("user_id");


--
-- Name: idx_telemetry_equipment; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_telemetry_equipment" ON "public"."hardware_telemetry" USING "btree" ("equipment_id");


--
-- Name: idx_telemetry_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_telemetry_order" ON "public"."hardware_telemetry" USING "btree" ("order_id");


--
-- Name: idx_telemetry_tenant; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_telemetry_tenant" ON "public"."hardware_telemetry" USING "btree" ("tenant_id");


--
-- Name: idx_tenant_settings_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_tenant_settings_user" ON "public"."tenant_settings" USING "btree" ("user_id");


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "ix_realtime_subscription_entity" ON "realtime"."subscription" USING "btree" ("entity");


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_inserted_at_topic_index" ON ONLY "realtime"."messages" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_02_28_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_02_28_inserted_at_topic_idx" ON "realtime"."messages_2026_02_28" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_03_01_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_03_01_inserted_at_topic_idx" ON "realtime"."messages_2026_03_01" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_03_02_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_03_02_inserted_at_topic_idx" ON "realtime"."messages_2026_03_02" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_03_03_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_03_03_inserted_at_topic_idx" ON "realtime"."messages_2026_03_03" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_03_04_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_03_04_inserted_at_topic_idx" ON "realtime"."messages_2026_03_04" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_03_05_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_03_05_inserted_at_topic_idx" ON "realtime"."messages_2026_03_05" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: messages_2026_03_06_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX "messages_2026_03_06_inserted_at_topic_idx" ON "realtime"."messages_2026_03_06" USING "btree" ("inserted_at" DESC, "topic") WHERE (("extension" = 'broadcast'::"text") AND ("private" IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX "subscription_subscription_id_entity_filters_action_filter_key" ON "realtime"."subscription" USING "btree" ("subscription_id", "entity", "filters", "action_filter");


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX "bname" ON "storage"."buckets" USING "btree" ("name");


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX "bucketid_objname" ON "storage"."objects" USING "btree" ("bucket_id", "name");


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX "buckets_analytics_unique_name_idx" ON "storage"."buckets_analytics" USING "btree" ("name") WHERE ("deleted_at" IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX "idx_multipart_uploads_list" ON "storage"."s3_multipart_uploads" USING "btree" ("bucket_id", "key", "created_at");


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX "idx_objects_bucket_id_name" ON "storage"."objects" USING "btree" ("bucket_id", "name" COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX "idx_objects_bucket_id_name_lower" ON "storage"."objects" USING "btree" ("bucket_id", "lower"("name") COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX "name_prefix_search" ON "storage"."objects" USING "btree" ("name" "text_pattern_ops");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX "vector_indexes_name_bucket_id_idx" ON "storage"."vector_indexes" USING "btree" ("name", "bucket_id");


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: -
--

CREATE INDEX "supabase_functions_hooks_h_table_id_h_name_idx" ON "supabase_functions"."hooks" USING "btree" ("hook_table_id", "hook_name");


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: -
--

CREATE INDEX "supabase_functions_hooks_request_id_idx" ON "supabase_functions"."hooks" USING "btree" ("request_id");


--
-- Name: messages_2026_02_28_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_02_28_inserted_at_topic_idx";


--
-- Name: messages_2026_02_28_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_02_28_pkey";


--
-- Name: messages_2026_03_01_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_03_01_inserted_at_topic_idx";


--
-- Name: messages_2026_03_01_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_03_01_pkey";


--
-- Name: messages_2026_03_02_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_03_02_inserted_at_topic_idx";


--
-- Name: messages_2026_03_02_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_03_02_pkey";


--
-- Name: messages_2026_03_03_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_03_03_inserted_at_topic_idx";


--
-- Name: messages_2026_03_03_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_03_03_pkey";


--
-- Name: messages_2026_03_04_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_03_04_inserted_at_topic_idx";


--
-- Name: messages_2026_03_04_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_03_04_pkey";


--
-- Name: messages_2026_03_05_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_03_05_inserted_at_topic_idx";


--
-- Name: messages_2026_03_05_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_03_05_pkey";


--
-- Name: messages_2026_03_06_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_inserted_at_topic_index" ATTACH PARTITION "realtime"."messages_2026_03_06_inserted_at_topic_idx";


--
-- Name: messages_2026_03_06_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX "realtime"."messages_pkey" ATTACH PARTITION "realtime"."messages_2026_03_06_pkey";


--
-- Name: schedules enviar_lembrete_n8n; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "enviar_lembrete_n8n" AFTER UPDATE ON "public"."schedules" FOR EACH ROW EXECUTE FUNCTION "supabase_functions"."http_request"('https://n8n.wfixtech.com.br/webhook-test/agendamentos', 'POST', '{"Content-type":"application/json"}', '{}', '5000');


--
-- Name: schedules on_schedule_event; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "on_schedule_event" AFTER INSERT OR UPDATE ON "public"."schedules" FOR EACH ROW EXECUTE FUNCTION "public"."notify_n8n_on_schedule_change"();


--
-- Name: orders trg_order_status_change; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trg_order_status_change" AFTER UPDATE OF "status" ON "public"."orders" FOR EACH ROW EXECUTE FUNCTION "public"."fn_log_order_status_change"();


--
-- Name: customers trigger_customers_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trigger_customers_updated_at" BEFORE UPDATE ON "public"."customers" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();


--
-- Name: equipments trigger_equipments_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trigger_equipments_updated_at" BEFORE UPDATE ON "public"."equipments" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();


--
-- Name: orders trigger_generate_smart_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trigger_generate_smart_id" BEFORE INSERT ON "public"."orders" FOR EACH ROW EXECUTE FUNCTION "public"."generate_smart_id"();


--
-- Name: leads trigger_leads_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trigger_leads_updated_at" BEFORE UPDATE ON "public"."leads" FOR EACH ROW EXECUTE FUNCTION "public"."update_active_leads_updated_at"();


--
-- Name: orders trigger_orders_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "trigger_orders_updated_at" BEFORE UPDATE ON "public"."orders" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at"();


--
-- Name: schedule_settings update_schedule_settings_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "update_schedule_settings_updated_at" BEFORE UPDATE ON "public"."schedule_settings" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();


--
-- Name: schedules update_schedules_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "update_schedules_updated_at" BEFORE UPDATE ON "public"."schedules" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER "tr_check_filters" BEFORE INSERT OR UPDATE ON "realtime"."subscription" FOR EACH ROW EXECUTE FUNCTION "realtime"."subscription_check_filters"();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER "enforce_bucket_name_length_trigger" BEFORE INSERT OR UPDATE OF "name" ON "storage"."buckets" FOR EACH ROW EXECUTE FUNCTION "storage"."enforce_bucket_name_length"();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER "protect_buckets_delete" BEFORE DELETE ON "storage"."buckets" FOR EACH STATEMENT EXECUTE FUNCTION "storage"."protect_delete"();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER "protect_objects_delete" BEFORE DELETE ON "storage"."objects" FOR EACH STATEMENT EXECUTE FUNCTION "storage"."protect_delete"();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER "update_objects_updated_at" BEFORE UPDATE ON "storage"."objects" FOR EACH ROW EXECUTE FUNCTION "storage"."update_updated_at_column"();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."identities"
    ADD CONSTRAINT "identities_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_amr_claims"
    ADD CONSTRAINT "mfa_amr_claims_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions"("id") ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_challenges"
    ADD CONSTRAINT "mfa_challenges_auth_factor_id_fkey" FOREIGN KEY ("factor_id") REFERENCES "auth"."mfa_factors"("id") ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."mfa_factors"
    ADD CONSTRAINT "mfa_factors_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_authorizations"
    ADD CONSTRAINT "oauth_authorizations_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "auth"."oauth_clients"("id") ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_authorizations"
    ADD CONSTRAINT "oauth_authorizations_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_consents"
    ADD CONSTRAINT "oauth_consents_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "auth"."oauth_clients"("id") ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."oauth_consents"
    ADD CONSTRAINT "oauth_consents_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."one_time_tokens"
    ADD CONSTRAINT "one_time_tokens_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."refresh_tokens"
    ADD CONSTRAINT "refresh_tokens_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions"("id") ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."saml_providers"
    ADD CONSTRAINT "saml_providers_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_flow_state_id_fkey" FOREIGN KEY ("flow_state_id") REFERENCES "auth"."flow_state"("id") ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."saml_relay_states"
    ADD CONSTRAINT "saml_relay_states_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_oauth_client_id_fkey" FOREIGN KEY ("oauth_client_id") REFERENCES "auth"."oauth_clients"("id") ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."sessions"
    ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY "auth"."sso_domains"
    ADD CONSTRAINT "sso_domains_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers"("id") ON DELETE CASCADE;


--
-- Name: customers customers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "customers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: equipments equipments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."equipments"
    ADD CONSTRAINT "equipments_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: follow_ups follow_ups_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."follow_ups"
    ADD CONSTRAINT "follow_ups_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL;


--
-- Name: follow_ups follow_ups_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."follow_ups"
    ADD CONSTRAINT "follow_ups_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;


--
-- Name: hardware_telemetry hardware_telemetry_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."hardware_telemetry"
    ADD CONSTRAINT "hardware_telemetry_equipment_id_fkey" FOREIGN KEY ("equipment_id") REFERENCES "public"."equipments"("id") ON DELETE CASCADE;


--
-- Name: hardware_telemetry hardware_telemetry_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."hardware_telemetry"
    ADD CONSTRAINT "hardware_telemetry_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;


--
-- Name: hardware_telemetry hardware_telemetry_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."hardware_telemetry"
    ADD CONSTRAINT "hardware_telemetry_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE CASCADE;


--
-- Name: leads leads_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."leads"
    ADD CONSTRAINT "leads_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE CASCADE;


--
-- Name: nps_feedbacks nps_feedbacks_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."nps_feedbacks"
    ADD CONSTRAINT "nps_feedbacks_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: nps_feedbacks nps_feedbacks_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."nps_feedbacks"
    ADD CONSTRAINT "nps_feedbacks_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;


--
-- Name: order_logs order_logs_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."order_logs"
    ADD CONSTRAINT "order_logs_changed_by_fkey" FOREIGN KEY ("changed_by") REFERENCES "auth"."users"("id");


--
-- Name: order_logs order_logs_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."order_logs"
    ADD CONSTRAINT "order_logs_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL;


--
-- Name: orders orders_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_equipment_id_fkey" FOREIGN KEY ("equipment_id") REFERENCES "public"."equipments"("id") ON DELETE SET NULL;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: schedule_settings schedule_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedule_settings"
    ADD CONSTRAINT "schedule_settings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: schedules schedules_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedules"
    ADD CONSTRAINT "schedules_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL;


--
-- Name: schedules schedules_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedules"
    ADD CONSTRAINT "schedules_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE SET NULL;


--
-- Name: schedules schedules_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schedules"
    ADD CONSTRAINT "schedules_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: service_catalog service_catalog_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."service_catalog"
    ADD CONSTRAINT "service_catalog_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE CASCADE;


--
-- Name: task_presets task_presets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_presets"
    ADD CONSTRAINT "task_presets_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id");


--
-- Name: technical_reports technical_reports_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."technical_reports"
    ADD CONSTRAINT "technical_reports_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;


--
-- Name: tenant_settings tenant_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tenant_settings"
    ADD CONSTRAINT "tenant_settings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: tenants tenants_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tenants"
    ADD CONSTRAINT "tenants_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."objects"
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets"("id");


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."s3_multipart_uploads"
    ADD CONSTRAINT "s3_multipart_uploads_bucket_id_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets"("id");


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."s3_multipart_uploads_parts"
    ADD CONSTRAINT "s3_multipart_uploads_parts_bucket_id_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets"("id");


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."s3_multipart_uploads_parts"
    ADD CONSTRAINT "s3_multipart_uploads_parts_upload_id_fkey" FOREIGN KEY ("upload_id") REFERENCES "storage"."s3_multipart_uploads"("id") ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY "storage"."vector_indexes"
    ADD CONSTRAINT "vector_indexes_bucket_id_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets_vectors"("id");


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."audit_log_entries" ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."flow_state" ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."identities" ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."instances" ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."mfa_amr_claims" ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."mfa_challenges" ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."mfa_factors" ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."one_time_tokens" ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."refresh_tokens" ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."saml_providers" ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."saml_relay_states" ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."schema_migrations" ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."sessions" ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."sso_domains" ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."sso_providers" ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE "auth"."users" ENABLE ROW LEVEL SECURITY;

--
-- Name: leads Admins can update leads; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can update leads" ON "public"."leads" FOR UPDATE USING (("auth"."role"() = 'authenticated'::"text"));


--
-- Name: leads Admins can view leads; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins can view leads" ON "public"."leads" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));


--
-- Name: schedules Clientes podem ver agendamento pelo token; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Clientes podem ver agendamento pelo token" ON "public"."schedules" FOR SELECT USING (true);


--
-- Name: follow_ups Enable all for authenticated users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable all for authenticated users" ON "public"."follow_ups" USING (true) WITH CHECK (true);


--
-- Name: nps_feedbacks Enable insert for everyone; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable insert for everyone" ON "public"."nps_feedbacks" FOR INSERT WITH CHECK (true);


--
-- Name: technical_reports Enable insert/update for authenticated users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable insert/update for authenticated users" ON "public"."technical_reports" USING (("auth"."role"() = 'authenticated'::"text"));


--
-- Name: technical_reports Enable read access for all users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable read access for all users" ON "public"."technical_reports" FOR SELECT USING (true);


--
-- Name: nps_feedbacks Enable read for service role only; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable read for service role only" ON "public"."nps_feedbacks" FOR SELECT USING (("auth"."role"() = 'service_role'::"text"));


--
-- Name: leads Permitir inserção pública; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir inserção pública" ON "public"."leads" FOR INSERT WITH CHECK (true);


--
-- Name: leads Permitir leitura para admin; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir leitura para admin" ON "public"."leads" FOR SELECT TO "authenticated" USING (true);


--
-- Name: leads Public can insert leads; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public can insert leads" ON "public"."leads" FOR INSERT WITH CHECK (true);


--
-- Name: schedules Técnicos podem atualizar seus agendamentos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem atualizar seus agendamentos" ON "public"."schedules" FOR UPDATE USING (("auth"."uid"() = "user_id"));


--
-- Name: schedule_settings Técnicos podem atualizar suas configurações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem atualizar suas configurações" ON "public"."schedule_settings" FOR UPDATE USING (("auth"."uid"() = "user_id"));


--
-- Name: schedules Técnicos podem excluir seus agendamentos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem excluir seus agendamentos" ON "public"."schedules" FOR DELETE USING (("auth"."uid"() = "user_id"));


--
-- Name: schedules Técnicos podem inserir agendamentos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem inserir agendamentos" ON "public"."schedules" FOR INSERT WITH CHECK (("auth"."uid"() = "user_id"));


--
-- Name: schedule_settings Técnicos podem inserir suas configurações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem inserir suas configurações" ON "public"."schedule_settings" FOR INSERT WITH CHECK (("auth"."uid"() = "user_id"));


--
-- Name: schedules Técnicos podem ver seus agendamentos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem ver seus agendamentos" ON "public"."schedules" FOR SELECT USING (("auth"."uid"() = "user_id"));


--
-- Name: schedule_settings Técnicos podem ver suas configurações; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Técnicos podem ver suas configurações" ON "public"."schedule_settings" FOR SELECT USING (("auth"."uid"() = "user_id"));


--
-- Name: task_presets Users can create own presets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can create own presets" ON "public"."task_presets" FOR INSERT WITH CHECK (("auth"."uid"() = "user_id"));


--
-- Name: task_presets Users can delete own presets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can delete own presets" ON "public"."task_presets" FOR DELETE USING (("auth"."uid"() = "user_id"));


--
-- Name: hardware_telemetry Users can insert telemetry for their tenant; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can insert telemetry for their tenant" ON "public"."hardware_telemetry" FOR INSERT WITH CHECK (("tenant_id" = (( SELECT ("auth"."jwt"() ->> 'tenant_id'::"text")))::"uuid"));


--
-- Name: service_catalog Users can view and manage their own service catalog; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view and manage their own service catalog" ON "public"."service_catalog" USING (("auth"."uid"() = "tenant_id")) WITH CHECK (("auth"."uid"() = "tenant_id"));


--
-- Name: task_presets Users can view own presets; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view own presets" ON "public"."task_presets" FOR SELECT USING (("auth"."uid"() = "user_id"));


--
-- Name: hardware_telemetry Users can view telemetry from their tenant; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Users can view telemetry from their tenant" ON "public"."hardware_telemetry" FOR SELECT USING (("tenant_id" = (( SELECT ("auth"."jwt"() ->> 'tenant_id'::"text")))::"uuid"));


--
-- Name: customers; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."customers" ENABLE ROW LEVEL SECURITY;

--
-- Name: equipments; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."equipments" ENABLE ROW LEVEL SECURITY;

--
-- Name: follow_ups; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."follow_ups" ENABLE ROW LEVEL SECURITY;

--
-- Name: hardware_telemetry; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."hardware_telemetry" ENABLE ROW LEVEL SECURITY;

--
-- Name: leads; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."leads" ENABLE ROW LEVEL SECURITY;

--
-- Name: nps_feedbacks; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."nps_feedbacks" ENABLE ROW LEVEL SECURITY;

--
-- Name: order_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."order_items" ENABLE ROW LEVEL SECURITY;

--
-- Name: order_logs; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."order_logs" ENABLE ROW LEVEL SECURITY;

--
-- Name: orders; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;

--
-- Name: customers policy_customers_isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_customers_isolation" ON "public"."customers" USING (("user_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));


--
-- Name: equipments policy_equipments_isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_equipments_isolation" ON "public"."equipments" USING ((EXISTS ( SELECT 1
   FROM "public"."customers"
  WHERE (("customers"."id" = "equipments"."customer_id") AND ("customers"."user_id" = ( SELECT "auth"."uid"() AS "uid")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."customers"
  WHERE (("customers"."id" = "equipments"."customer_id") AND ("customers"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));


--
-- Name: order_items policy_order_items_isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_order_items_isolation" ON "public"."order_items" USING ((EXISTS ( SELECT 1
   FROM "public"."orders"
  WHERE (("orders"."id" = "order_items"."order_id") AND ("orders"."user_id" = ( SELECT "auth"."uid"() AS "uid")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."orders"
  WHERE (("orders"."id" = "order_items"."order_id") AND ("orders"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));


--
-- Name: order_logs policy_order_logs_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_order_logs_insert" ON "public"."order_logs" FOR INSERT WITH CHECK (("auth"."role"() = 'authenticated'::"text"));


--
-- Name: order_logs policy_order_logs_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_order_logs_select" ON "public"."order_logs" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."orders"
  WHERE (("orders"."id" = "order_logs"."order_id") AND ("orders"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));


--
-- Name: orders policy_orders_isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_orders_isolation" ON "public"."orders" USING (("user_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));


--
-- Name: tenants policy_tenants_isolation; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "policy_tenants_isolation" ON "public"."tenants" USING (("id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("id" = ( SELECT "auth"."uid"() AS "uid")));


--
-- Name: schedule_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."schedule_settings" ENABLE ROW LEVEL SECURITY;

--
-- Name: schedules; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."schedules" ENABLE ROW LEVEL SECURITY;

--
-- Name: service_catalog; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."service_catalog" ENABLE ROW LEVEL SECURITY;

--
-- Name: task_presets; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."task_presets" ENABLE ROW LEVEL SECURITY;

--
-- Name: technical_reports; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."technical_reports" ENABLE ROW LEVEL SECURITY;

--
-- Name: tenant_settings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."tenant_settings" ENABLE ROW LEVEL SECURITY;

--
-- Name: tenants; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE "public"."tenants" ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE "realtime"."messages" ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Authenticated can delete evidence; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated can delete evidence" ON "storage"."objects" FOR DELETE USING ((("bucket_id" = 'os-evidence'::"text") AND ("auth"."role"() = 'authenticated'::"text")));


--
-- Name: objects Authenticated can upload evidence; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated can upload evidence" ON "storage"."objects" FOR INSERT WITH CHECK ((("bucket_id" = 'os-evidence'::"text") AND ("auth"."role"() = 'authenticated'::"text")));


--
-- Name: objects Public Insert; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Public Insert" ON "storage"."objects" FOR INSERT WITH CHECK (("bucket_id" = 'order-evidence'::"text"));


--
-- Name: objects Public Select; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Public Select" ON "storage"."objects" FOR SELECT USING (("bucket_id" = 'order-evidence'::"text"));


--
-- Name: objects Public Update; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Public Update" ON "storage"."objects" FOR UPDATE USING (("bucket_id" = 'order-evidence'::"text"));


--
-- Name: objects Public can view evidence; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Public can view evidence" ON "storage"."objects" FOR SELECT USING (("bucket_id" = 'os-evidence'::"text"));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."buckets" ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."buckets_analytics" ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."buckets_vectors" ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."migrations" ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."objects" ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."s3_multipart_uploads" ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."s3_multipart_uploads_parts" ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE "storage"."vector_indexes" ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION "supabase_realtime" WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION "supabase_realtime_messages_publication" WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime orders; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."orders";


--
-- Name: supabase_realtime schedules; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."schedules";


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: -
--

ALTER PUBLICATION "supabase_realtime_messages_publication" ADD TABLE ONLY "realtime"."messages";


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER "issue_graphql_placeholder" ON "sql_drop"
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION "extensions"."set_graphql_placeholder"();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER "issue_pg_cron_access" ON "ddl_command_end"
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION "extensions"."grant_pg_cron_access"();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER "issue_pg_graphql_access" ON "ddl_command_end"
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION "extensions"."grant_pg_graphql_access"();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER "issue_pg_net_access" ON "ddl_command_end"
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION "extensions"."grant_pg_net_access"();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER "pgrst_ddl_watch" ON "ddl_command_end"
   EXECUTE FUNCTION "extensions"."pgrst_ddl_watch"();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER "pgrst_drop_watch" ON "sql_drop"
   EXECUTE FUNCTION "extensions"."pgrst_drop_watch"();


--
-- PostgreSQL database dump complete
--

\unrestrict j3YbYmPzdj1rQUNYYFnNUk4q0nMrGuBLTsKGCWiUfe7R3vt2wutdOVUycPOQK5S

