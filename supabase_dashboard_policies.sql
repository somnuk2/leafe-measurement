-- Run this in Supabase SQL Editor.

alter table public.calibrations enable row level security;
alter table public.leaf_measurements enable row level security;

grant select on table public.calibrations to anon;
grant select on table public.leaf_measurements to anon;

drop policy if exists "Dashboard read calibrations" on public.calibrations;
create policy "Dashboard read calibrations"
on public.calibrations
for select
to anon
using (true);

drop policy if exists "Dashboard read leaf measurements" on public.leaf_measurements;
create policy "Dashboard read leaf measurements"
on public.leaf_measurements
for select
to anon
using (true);

grant insert on table public.calibrations to anon;
grant insert on table public.leaf_measurements to anon;

drop policy if exists "ESP32 insert calibration" on public.calibrations;
create policy "ESP32 insert calibration"
on public.calibrations
for insert
to anon
with check (true);

drop policy if exists "ESP32 insert leaf measurement" on public.leaf_measurements;
create policy "ESP32 insert leaf measurement"
on public.leaf_measurements
for insert
to anon
with check (true);

-- Admin dashboard delete (multi-select). NOTE: this allows any client holding the
-- public anon key to delete rows via the REST API. See README for hardening advice.
grant delete on table public.calibrations to anon;
grant delete on table public.leaf_measurements to anon;

drop policy if exists "Admin delete calibrations" on public.calibrations;
create policy "Admin delete calibrations"
on public.calibrations
for delete
to anon
using (true);

drop policy if exists "Admin delete leaf measurements" on public.leaf_measurements;
create policy "Admin delete leaf measurements"
on public.leaf_measurements
for delete
to anon
using (true);
