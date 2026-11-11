Add-Type -AssemblyName System.Drawing

function Crop-Image($srcPath, $destPath, $x, $y, $w, $h) {
    $src = [System.Drawing.Image]::FromFile($srcPath)
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $rectSrc = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
    $rectDest = New-Object System.Drawing.Rectangle(0, 0, $w, $h)
    $g.DrawImage($src, $rectDest, $rectSrc, [System.Drawing.GraphicsUnit]::Pixel)
    $bmp.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    $src.Dispose()
    Write-Output "Saved $destPath ($w x $h)"
}

# Clean hero right-side background without text or card edge
Crop-Image 'RESOURCES\home space.png' 'assets\hero_earth_satellite.png' 790 70 882 520

# Launches top right rocket launch background without text
Crop-Image 'RESOURCES\lanches.png' 'assets\launches_hero_bg.png' 1050 70 622 260

# Explore Earth horizon background
Crop-Image 'RESOURCES\space explore.png' 'assets\explore_earth_bg.png' 850 70 822 260

# Glossary hero background
Crop-Image 'RESOURCES\gloss.png' 'assets\glossary_hero_bg.png' 850 70 822 260

# Next Launch card rocket art (strictly rocket & towers, no text)
Crop-Image 'RESOURCES\lanches.png' 'assets\launch_rocket_art.png' 1445 575 195 290

# Clean satellite thumbnails (inside border)
Crop-Image 'RESOURCES\space explore.png' 'assets\sat_iss.png' 450 442 200 106
Crop-Image 'RESOURCES\space explore.png' 'assets\sat_starlink.png' 450 612 200 106
Crop-Image 'RESOURCES\space explore.png' 'assets\sat_noaa.png' 450 782 200 106

# Rocket thumbnails (inside border)
Crop-Image 'RESOURCES\lanches.png' 'assets\launch_pslv.png' 68 382 198 108
Crop-Image 'RESOURCES\lanches.png' 'assets\launch_falcon9.png' 68 564 198 108
Crop-Image 'RESOURCES\lanches.png' 'assets\launch_ariane6.png' 68 746 198 108

# Glossary thumbnails (inside border)
Crop-Image 'RESOURCES\gloss.png' 'assets\gloss_satellite.png' 526 348 200 102
Crop-Image 'RESOURCES\gloss.png' 'assets\gloss_orbit.png' 526 498 200 102
Crop-Image 'RESOURCES\gloss.png' 'assets\gloss_vehicle.png' 526 648 200 102
Crop-Image 'RESOURCES\gloss.png' 'assets\gloss_iss.png' 526 798 200 102
