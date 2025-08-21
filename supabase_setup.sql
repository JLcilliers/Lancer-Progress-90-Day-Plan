-- Run this SQL in your Supabase SQL Editor to create the necessary table

CREATE TABLE IF NOT EXISTS lancer_seo_tasks (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    project_id TEXT NOT NULL,
    task_id TEXT NOT NULL,
    completed BOOLEAN DEFAULT false,
    completed_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(project_id, task_id)
);

-- Enable Row Level Security
ALTER TABLE lancer_seo_tasks ENABLE ROW LEVEL SECURITY;

-- Create a policy that allows anonymous users to read and write
CREATE POLICY "Enable all for anon" ON lancer_seo_tasks
    FOR ALL 
    USING (true) 
    WITH CHECK (true);

-- Optional: Create an index for better performance
CREATE INDEX idx_lancer_seo_tasks_project_id ON lancer_seo_tasks(project_id);