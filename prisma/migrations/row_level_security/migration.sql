-- Enable Row Level Security
ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "UserIdentity" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "Botlet" ENABLE ROW LEVEL SECURITY;

-- Force Row Level Security for table owners
ALTER TABLE "User" FORCE ROW LEVEL SECURITY;
ALTER TABLE "UserIdentity" FORCE ROW LEVEL SECURITY;
ALTER TABLE "Botlet" FORCE ROW LEVEL SECURITY;

-- Create row security policies
CREATE POLICY tenant_isolation_policy ON "User" USING ("tenantId" = current_setting('tenancy.tenantId', TRUE)::int);
CREATE POLICY tenant_isolation_policy ON "UserIdentity" USING ("tenantId" = current_setting('tenancy.tenantId', TRUE)::int);
CREATE POLICY tenant_isolation_policy ON "Botlet" USING ("tenantId" = current_setting('tenancy.tenantId', TRUE)::int);

-- Create policies to bypass RLS (optional)
CREATE POLICY bypass_rls_policy ON "User" USING (current_setting('tenancy.bypass_rls', TRUE)::text = 'on');
CREATE POLICY bypass_rls_policy ON "UserIdentity" USING (current_setting('tenancy.bypass_rls', TRUE)::text = 'on');
CREATE POLICY bypass_rls_policy ON "Botlet" USING (current_setting('tenancy.bypass_rls', TRUE)::text = 'on');
