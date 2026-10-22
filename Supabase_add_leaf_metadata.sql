alter table public.leaf_measurements
add column if not exists tree_id text,
add column if not exists leaf_id text,
add column if not exists variety text;

-- Backfill historical rows so the dashboard shows data before the ESP32
-- firmware is updated to send the new fields. Safe to re-run: only fills
-- rows where the new column is still empty.
update public.leaf_measurements
set tree_id = sample_code,
    leaf_id = sample_name,
    variety = plant_type
where (tree_id is null or tree_id = '')
  and sample_code is not null;
