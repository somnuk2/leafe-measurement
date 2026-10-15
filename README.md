# Leaf Spectral Dashboard

1. Run supabase_dashboard_policies.sql in Supabase SQL Editor.
2. Upload this folder to Netlify Drop or connect it to Git.
3. The dashboard reads calibrations and leaf_measurements and refreshes every 60 seconds.
4. Use **Download Excel** to export all rows from Supabase into an `.xlsx` workbook with separate Leaf Measurements and Calibrations sheets.
5. Click **Admin** (top right) and log in to enable multi-select delete on the Measurement / Calibration history tables.

Admin notes:

- Credentials: username `admin`, password `123458` (stored as a SHA-256 hash in `index.html`; change it by replacing `ADMIN_PASS_HASH` with `sha256("yourpassword")`).
- Deleting rows requires the DELETE grants/policies at the bottom of `supabase_dashboard_policies.sql`.
- Security: the anon key is public, so anyone can call the Supabase REST API directly and delete data while the open DELETE policy exists — the password only hides the UI. For real protection, move to Supabase Auth (authenticated role + RLS) or a Netlify Edge Function with a server-side secret.
