-- Create the lancer_seo_tasks table for storing 90-day plan progress
CREATE TABLE IF NOT EXISTS lancer_seo_tasks (
    id BIGSERIAL PRIMARY KEY,
    project_id TEXT NOT NULL,
    week INTEGER NOT NULL,
    task_title TEXT NOT NULL,
    detailed_fix TEXT,
    expected_outcome TEXT,
    completed BOOLEAN DEFAULT FALSE,
    notes JSONB DEFAULT '{"links": [], "decisions": [], "evidence": []}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Ensure unique combination of project_id and week
    UNIQUE(project_id, week)
);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_lancer_seo_tasks_project_id ON lancer_seo_tasks(project_id);
CREATE INDEX IF NOT EXISTS idx_lancer_seo_tasks_week ON lancer_seo_tasks(week);

-- Enable Row Level Security
ALTER TABLE lancer_seo_tasks ENABLE ROW LEVEL SECURITY;

-- Drop existing policy if it exists and create new one
DROP POLICY IF EXISTS "Allow all operations on lancer_seo_tasks" ON lancer_seo_tasks;

-- Create a policy that allows all operations (since this is for the client to view progress)
CREATE POLICY "Allow all operations on lancer_seo_tasks" ON lancer_seo_tasks
    FOR ALL USING (true) WITH CHECK (true);

-- Insert initial data if the table is empty
INSERT INTO lancer_seo_tasks (project_id, week, task_title, detailed_fix, expected_outcome)
VALUES 
    ('lancer-seo-90day-plan', 1, 'Fix broken links and 404s', 
     'Repair broken internal links, restore missing images, resolve page errors, and verify crawler access.',
     'Clean link profile improves user experience and crawl efficiency.'),
    
    ('lancer-seo-90day-plan', 2, 'Optimize title tags and meta descriptions',
     'Shorten long title tags, rewrite with keywords, create unique meta descriptions, fix H1 tags.',
     'Clear metadata improves click-through rates and prevents keyword confusion.'),
     
    ('lancer-seo-90day-plan', 3, 'Improve image alt text and compression',
     'Add descriptive alt text, compress images, implement lazy loading.',
     'Optimized images boost SEO, accessibility, and page speed.'),
     
    ('lancer-seo-90day-plan', 4, 'Enhance site speed and Core Web Vitals',
     'Enable compression, minify assets, optimize scripts, improve LCP/FID/CLS scores.',
     'Faster load times improve user experience and search rankings.'),
     
    ('lancer-seo-90day-plan', 5, 'Resolve orphan pages and site structure',
     'Integrate 246 orphan pages, reduce site depth, flatten architecture.',
     'Better crawl efficiency ensures all content is indexed and discoverable.'),
     
    ('lancer-seo-90day-plan', 6, 'Strengthen internal linking',
     'Create contextual links between content and products, strengthen weak pages.',
     'Better navigation and SEO flow between pages.'),
     
    ('lancer-seo-90day-plan', 7, 'Optimize product page content',
     'Expand descriptions, add FAQs, incorporate reviews, highlight trust signals.',
     'Richer content improves rankings and conversions.'),
     
    ('lancer-seo-90day-plan', 8, 'Implement structured data markup',
     'Add Product and Article schema, validate with Google Rich Results Test.',
     'Rich snippets improve visibility and click-through rates.'),
     
    ('lancer-seo-90day-plan', 9, 'Keyword gap analysis and content calendar',
     'Identify high-volume keywords, create 90-day content plan.',
     'Strategic content captures non-branded organic traffic.'),
     
    ('lancer-seo-90day-plan', 10, 'On-page SEO tag audit',
     'Final review of titles, meta descriptions, and H1 tags.',
     'Refined metadata improves SERP appearance and CTR.'),
     
    ('lancer-seo-90day-plan', 11, 'Image and anchor text improvement',
     'Add missing alt text, replace generic anchor text.',
     'Better accessibility and semantic context for links.'),
     
    ('lancer-seo-90day-plan', 12, 'Advanced structured data',
     'Implement additional schema types, ensure validation.',
     'Enhanced search presence with rich results.'),
     
    ('lancer-seo-90day-plan', 13, 'Technical health and crawlability',
     'Fix broken links, correct crawl blocks, integrate orphaned pages.',
     'Optimal crawl efficiency and full content indexation.')

ON CONFLICT (project_id, week) DO NOTHING;