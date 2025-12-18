# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['SDK_dashboard.py'],
    pathex=[],
    binaries=[('/Applications/FLIR Science File SDK.app/Contents/Resources/lib/*', './'), ('/Applications/FLIR Science File SDK.app/Contents/Resources/bin/*', './')],
    datas=[],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='FirebrandThermalAnalysis',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='FirebrandThermalAnalysis',
)
app = BUNDLE(
    coll,
    name='FirebrandThermalAnalysis.app',
    icon=None,
    bundle_identifier=None,
)
