# Supabase Setup Instructions for Lancer Progress Tracker

## Steps to Enable Supabase Sync:

1. **Go to your Supabase Dashboard**
   - Visit: https://supabase.com/dashboard
   - Select your project: `fihlfqufsltgkxbgonxo`

2. **Create the Required Table**
   - Navigate to the SQL Editor (left sidebar)
   - Copy and paste the contents of `supabase_setup.sql` file
   - Click "Run" to execute the SQL

3. **Verify the Setup**
   - Go to Table Editor in Supabase
   - You should see the `lancer_seo_tasks` table
   - The table should have RLS (Row Level Security) enabled

4. **Test Your Application**
   - Open your website: https://jlcilliers.github.io/Lancer_Progress/
   - Click on any task to mark it complete
   - Check if the connection status shows "✅ Connected - Real-time sync active"
   - The data should now persist in Supabase

## Troubleshooting:

- **If you see "Offline mode"**: The table hasn't been created yet in Supabase
- **If tasks don't save**: Check that Row Level Security policies are correctly set
- **Connection issues**: Verify your Supabase project is active and not paused

## Your Current Credentials (Already in index.html):
- **Supabase URL**: https://fihlfqufsltgkxbgonxo.supabase.co
- **Anon Key**: Already embedded in your HTML file

## Important Notes:
- No GitHub secrets are needed - credentials are embedded in the HTML
- The anon key is safe to expose as it only allows public operations
- Row Level Security protects your data at the database level