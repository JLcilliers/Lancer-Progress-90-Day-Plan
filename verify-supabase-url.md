# How to Find Your Correct Supabase URL

The connection is failing because the Supabase project URL appears to be incorrect. Follow these steps:

## Step 1: Get Your Correct Project URL

1. Go to https://supabase.com/dashboard
2. Select your project
3. Go to **Settings** (gear icon in sidebar)
4. Click on **API** in the settings menu
5. You'll see:
   - **Project URL**: This should look like `https://xxxxx.supabase.co`
   - **Project API keys - anon public**: This is your anon key

## Step 2: Check Project Status

Make sure your project is:
- **Active** (not paused) - Free tier projects pause after 1 week of inactivity
- If paused, click "Restore" to reactivate it

## Step 3: Update Your Files

Once you have the correct URL, you need to update it in:
1. `index.html` (line 867)
2. `test-connection.html` (line 68)

## Common Issues:

### Issue 1: Project is Paused
- Free tier Supabase projects automatically pause after 7 days of inactivity
- Solution: Go to dashboard and click "Restore" on your project

### Issue 2: Wrong Project Reference
- The project reference in the URL might be different than expected
- Solution: Copy the exact URL from your Supabase dashboard

### Issue 3: Project Deleted or Not Created
- The project might not exist
- Solution: Create a new Supabase project

## What Your URL Should Look Like:
```
https://[your-unique-reference].supabase.co
```

The reference part is usually a random string like:
- `xyzabc123def`
- `abcdefghijkl`

## Next Steps:
1. Get the correct URL from your Supabase dashboard
2. Tell me what the correct URL is
3. I'll update all the files with the correct URL