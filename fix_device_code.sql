-- Run this in Supabase SQL Editor.
--
-- The ESP32 firmware (9/10/11) had a bug: body.append("device_code", deviceCode)
-- sent the <input> DOM element instead of its .value, storing the literal
-- string "[object HTMLInputElement]" in device_code. This repairs those rows.

update public.leaf_measurements
set device_code = 'COLORIMETER-01'
where device_code = '[object HTMLInputElement]';

update public.calibrations
set device_code = 'COLORIMETER-01'
where device_code = '[object HTMLInputElement]';
