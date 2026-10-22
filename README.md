# Leaf Spectral Dashboard

1. Run supabase_dashboard_policies.sql in Supabase SQL Editor.
2. Run Supabase_add_leaf_metadata.sql in Supabase SQL Editor (adds tree_id / leaf_id / variety columns and backfills them from sample_code / sample_name / plant_type).
3. Upload this folder to Netlify Drop or connect it to Git.
4. The dashboard reads calibrations and leaf_measurements and refreshes every 60 seconds.
5. Use **Download Excel** to export all rows from Supabase into an `.xlsx` workbook with separate Leaf Measurements and Calibrations sheets.
6. Click **Admin** (top right) and log in to enable multi-select delete on the Measurement / Calibration history tables.

Dashboard fields: **Tree ID** (tree_id, falls back to sample_code), **Leaf ID** (leaf_id, falls back to sample_name), **Variety** (variety, falls back to plant_type), **Position** (derived from leaf_side + measurement_point, e.g. "Upper · Base"). Update the ESP32 firmware to send tree_id / leaf_id / variety directly once available.

Admin notes:

- Credentials: username `admin`, password `123458` (stored as a SHA-256 hash in `index.html`; change it by replacing `ADMIN_PASS_HASH` with `sha256("yourpassword")`).
- Deleting rows requires the DELETE grants/policies at the bottom of `supabase_dashboard_policies.sql`.
- Security: the anon key is public, so anyone can call the Supabase REST API directly and delete data while the open DELETE policy exists — the password only hides the UI. For real protection, move to Supabase Auth (authenticated role + RLS) or a Netlify Edge Function with a server-side secret.
