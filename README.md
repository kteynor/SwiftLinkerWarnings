# SwiftDll

Demonstrate linker warnings that are produced when building a `.dynamic` library product from a package, where a target ([`Wrapper`](./Sources/Wrapper)) depends on another target ([`Implementation`](./Sources/Implementation)) from the same package, on Windows.

---
### Build Logs

<details>
    <summary><code>swift build</code></summary>
    
    Building for debugging...
    [1/4] Compiling Implementation MathOps.swift
    [2/5] Merging module Implementation
    [3/5] Wrapping AST for Implementation for debugging
    [4/6] Compiling Wrapper OpsWrapper.swift
    [5/7] Merging module Wrapper
    [6/7] Wrapping AST for Wrapper for debugging
    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Addys5Int32VAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Subys5Int32VAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Mulys5Int32VAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Divys5Int32VSgAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    [7/7] Linking C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\ExampleLib.dll
    Build complete! (7.09s)
</details>

<details>
    <summary><code>swiftc build -Xlinker -verbose</code></summary>

    Building for debugging...
    [1/4] Compiling Implementation MathOps.swift
    [2/5] Merging module Implementation
    [3/5] Wrapping AST for Implementation for debugging
    [4/6] Compiling Wrapper OpsWrapper.swift
    [5/7] Merging module Wrapper
    [6/7] Wrapping AST for Wrapper for debugging
    lld-link: Reading C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk\usr\lib\swift\windows\x86_64\swiftrt.obj

    lld-link: Directives: C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk\usr\lib\swift\windows\x86_64\swiftrt.obj:  /DEFAULTLIB:msvcrt.lib /DEFAULTLIB:oldnames.lib /DEFAULTLIB:oldnames.lib /DEFAULTLIB:msvcrt.lib /include:pSwiftImageConstructor

    lld-link: Reading C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\Implementation.swiftmodule.o

    lld-link: Reading C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o

    lld-link: Directives: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o:  /DEFAULTLIB:swiftSwiftOnoneSupport.lib /DEFAULTLIB:swiftCore.lib /DEFAULTLIB:swift_Concurrency.lib /DEFAULTLIB:oldnames.lib /DEFAULTLIB:msvcrt.lib /EXPORT:$s14Implementation3Addys5Int32VAD_ADtF /EXPORT:$s14Implementation3Subys5Int32VAD_ADtF /EXPORT:$s14Implementation3Mulys5Int32VAD_ADtF /EXPORT:$s14Implementation3Divys5Int32VSgAD_ADtF /INCLUDE:$s14Implementation3Addys5Int32VAD_ADtF /INCLUDE:$s14Implementation3Subys5Int32VAD_ADtF /INCLUDE:$s14Implementation3Mulys5Int32VAD_ADtF /INCLUDE:$s14Implementation3Divys5Int32VSgAD_ADtF /INCLUDE:__swift_reflection_version

    lld-link: Reading C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o

    lld-link: Directives: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o:  /DEFAULTLIB:swift_Concurrency.lib /DEFAULTLIB:swiftCore.lib /DEFAULTLIB:swiftSwiftOnoneSupport.lib /DEFAULTLIB:oldnames.lib /DEFAULTLIB:msvcrt.lib /EXPORT:$s7Wrapper3Modyys5Int32V_ADtF /EXPORT:$s7Wrapper7Computeyys5Int32V_ADtF /INCLUDE:$s7Wrapper3Modyys5Int32V_ADtF /INCLUDE:$s7Wrapper7Computeyys5Int32V_ADtF /INCLUDE:__swift_reflection_version

    lld-link: Reading C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\Wrapper.swiftmodule.o

    lld-link: Reading C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\lib\x64\msvcrt.lib

    lld-link: Reading C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\lib\x64\oldnames.lib

    lld-link: Reading C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk\usr\lib\swift\windows/x86_64\swiftSwiftOnoneSupport.lib

    lld-link: Reading C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk\usr\lib\swift\windows/x86_64\swiftCore.lib

    lld-link: Reading C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk\usr\lib\swift\windows/x86_64\swift_Concurrency.lib

    lld-link: Reading swiftCore.dll

    lld-link: Reading swiftCore.dll

    lld-link: Reading msvcrt.lib(dll_dllmain.obj)

    lld-link: Directives: msvcrt.lib(dll_dllmain.obj):    /alternatename:_pRawDllMain=_pDefaultRawDllMain 

    lld-link: Loaded msvcrt.lib(dll_dllmain.obj) for _DllMainCRTStartup

    lld-link: Reading msvcrt.lib(loadcfg.obj)

    lld-link: Directives: msvcrt.lib(loadcfg.obj):    /alternatename:__volatile_metadata=__AbsoluteZero 

    lld-link: Loaded msvcrt.lib(loadcfg.obj) for _load_config_used

    lld-link: Reading msvcrt.lib(gs_support.obj)

    lld-link: Directives: msvcrt.lib(gs_support.obj):    

    lld-link: Loaded msvcrt.lib(gs_support.obj) for __security_init_cookie

    lld-link: Reading msvcrt.lib(dll_dllmain_stub.obj)

    lld-link: Directives: msvcrt.lib(dll_dllmain_stub.obj):    

    lld-link: Loaded msvcrt.lib(dll_dllmain_stub.obj) for DllMain

    lld-link: Reading msvcrt.lib(tncleanup.obj)

    lld-link: Directives: msvcrt.lib(tncleanup.obj):    

    lld-link: Loaded msvcrt.lib(tncleanup.obj) for void __cdecl __scrt_initialize_type_info(void)

    lld-link: Reading msvcrt.lib(default_local_stdio_options.obj)

    lld-link: Directives: msvcrt.lib(default_local_stdio_options.obj):    

    lld-link: Loaded msvcrt.lib(default_local_stdio_options.obj) for __scrt_initialize_default_local_stdio_options

    lld-link: Reading msvcrt.lib(utility.obj)

    lld-link: Directives: msvcrt.lib(utility.obj):    

    lld-link: Loaded msvcrt.lib(utility.obj) for __scrt_is_nonwritable_in_current_image

    lld-link: Reading msvcrt.lib(dyn_tls_init.obj)

    lld-link: Directives: msvcrt.lib(dyn_tls_init.obj):    

    lld-link: Loaded msvcrt.lib(dyn_tls_init.obj) for __scrt_get_dyn_tls_init_callback

    lld-link: Reading msvcrt.lib(utility_desktop.obj)

    lld-link: Directives: msvcrt.lib(utility_desktop.obj):    /alternatename:__scrt_exe_initialize_mta=__scrt_stub_for_initialize_mta 

    lld-link: Loaded msvcrt.lib(utility_desktop.obj) for __scrt_fastfail

    lld-link: Reading msvcrt.lib(initsect.obj)

    lld-link: Directives: msvcrt.lib(initsect.obj):    /MERGE:.rtc=.rdata 

    lld-link: Loaded msvcrt.lib(initsect.obj) for _RTC_Initialize

    lld-link: Reading msvcrt.lib(initializers.obj)

    lld-link: Directives: msvcrt.lib(initializers.obj):    /merge:.CRT=.rdata /alternatename:__acrt_initialize=__scrt_stub_for_acrt_initialize /alternatename:__acrt_uninitialize=__scrt_stub_for_acrt_uninitialize /alternatename:__acrt_uninitialize_critical=__scrt_stub_for_acrt_uninitialize_critical /alternatename:__acrt_thread_attach=__scrt_stub_for_acrt_thread_attach /alternatename:__acrt_thread_detach=__scrt_stub_for_acrt_thread_detach /alternatename:_is_c_termination_complete=__scrt_stub_for_is_c_termination_complete /alternatename:__vcrt_initialize=__scrt_stub_for_acrt_initialize /alternatename:__vcrt_uninitialize=__scrt_stub_for_acrt_uninitialize /alternatename:__vcrt_uninitialize_critical=__scrt_stub_for_acrt_uninitialize_critical /alternatename:__vcrt_thread_attach=__scrt_stub_for_acrt_thread_attach /alternatename:__vcrt_thread_detach=__scrt_stub_for_acrt_thread_detach /defaultlib:kernel32.lib /defaultlib:msvcrt.lib /disallowlib:msvcrtd.lib /disallowlib:libcmt.lib /disallowlib:libcmtd.lib /defaultlib:vcruntime.lib /disallowlib:vcruntimed.lib /disallowlib:libvcruntime.lib /disallowlib:libvcruntimed.lib /defaultlib:ucrt.lib /disallowlib:ucrtd.lib /disallowlib:libucrt.lib /disallowlib:libucrtd.lib 

    lld-link: Loaded msvcrt.lib(initializers.obj) for __xi_a

    lld-link: Reading msvcrt.lib(guard_support.obj)

    lld-link: Directives: msvcrt.lib(guard_support.obj):    

    lld-link: Loaded msvcrt.lib(guard_support.obj) for __guard_dispatch_icall_fptr

    lld-link: Reading msvcrt.lib(gs_cookie.obj)

    lld-link: Directives: msvcrt.lib(gs_cookie.obj):    

    lld-link: Loaded msvcrt.lib(gs_cookie.obj) for __security_cookie

    lld-link: Reading msvcrt.lib(cpu_disp.obj)

    lld-link: Directives: msvcrt.lib(cpu_disp.obj):    

    lld-link: Loaded msvcrt.lib(cpu_disp.obj) for __isa_available_init

    lld-link: Reading msvcrt.lib(argv_mode.obj)

    lld-link: Directives: msvcrt.lib(argv_mode.obj):    

    lld-link: Loaded msvcrt.lib(argv_mode.obj) for _get_startup_argv_mode

    lld-link: Reading msvcrt.lib(ucrt_detection.obj)

    lld-link: Directives: msvcrt.lib(ucrt_detection.obj):    

    lld-link: Loaded msvcrt.lib(ucrt_detection.obj) for __scrt_is_ucrt_dll_in_use

    lld-link: Reading C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\x64\kernel32.lib

    lld-link: Reading C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\lib\x64\vcruntime.lib

    lld-link: Reading C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x64\ucrt.lib

    lld-link: Reading msvcrt.lib(guard_dispatch.obj)

    lld-link: Loaded msvcrt.lib(guard_dispatch.obj) for _guard_dispatch_icall_nop

    lld-link: Reading msvcrt.lib(guard_xfg_dispatch.obj)

    lld-link: Loaded msvcrt.lib(guard_xfg_dispatch.obj) for _guard_xfg_dispatch_icall_nop

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading KERNEL32.dll

    lld-link: Reading VCRUNTIME140.dll

    lld-link: Reading VCRUNTIME140.dll

    lld-link: Reading VCRUNTIME140.dll

    lld-link: Reading VCRUNTIME140.dll

    lld-link: Reading VCRUNTIME140.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading api-ms-win-crt-runtime-l1-1-0.dll

    lld-link: Reading msvcrt.lib(ucrt_stubs.obj)

    lld-link: Directives: msvcrt.lib(ucrt_stubs.obj):    

    lld-link: Loaded msvcrt.lib(ucrt_stubs.obj) for __scrt_stub_for_acrt_initialize

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Addys5Int32VAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Subys5Int32VAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Mulys5Int32VAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: warning: C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Wrapper.build\OpsWrapper.swift.o: locally defined symbol imported: $s14Implementation3Divys5Int32VSgAD_ADtF (defined in C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\Implementation.build\MathOps.swift.o) [LNK4217]

    lld-link: ICF needed 2 iterations

    lld-link: Selected __scrt_stub_for_acrt_initialize

    lld-link:   Removed __scrt_stub_for_acrt_uninitialize

    lld-link:   Removed __scrt_stub_for_acrt_uninitialize_critical

    lld-link:   Removed __scrt_stub_for_acrt_thread_attach

    lld-link:   Removed __scrt_stub_for_acrt_thread_detach

    lld-link: Selected 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link: Selected 

    lld-link:   Removed 

    lld-link: Selected 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link: Selected 

    lld-link:   Removed 

    lld-link:   Removed 

    lld-link:   Removed 

    Discarded _CRT_INIT
    Discarded ?dllmain_raw@@YAHQEAUHINSTANCE__@@KQEAX@Z
    Discarded __get_entropy
    Discarded atexit
    Discarded _onexit
    Discarded at_quick_exit
    Discarded NtCurrentTeb
    Discarded ?configure_argv@__scrt_narrow_argv_policy@@SAHXZ
    Discarded ?initialize_environment@__scrt_narrow_environment_policy@@SAHXZ
    Discarded ?is_potentially_valid_image_base@@YA_NQEAX@Z
    Discarded ?find_pe_section@@YAPEAU_IMAGE_SECTION_HEADER@@QEAE_K@Z
    Discarded __scrt_get_show_window_mode
    Discarded __scrt_is_managed_app
    Discarded __scrt_initialize_winrt
    Discarded __scrt_initialize_mta
    Discarded __scrt_set_unhandled_exception_filter
    Discarded __scrt_stub_for_initialize_mta
    Discarded __scrt_unhandled_exception_filter
    Discarded __CastGuardVftablesStart
    Discarded __CastGuardVftablesEnd
    Discarded ReadNoFence64
    Discarded ReadPointerNoFence
    Discarded _guard_icall_checks_enforced
    Discarded _guard_rf_checks_enforced
    Discarded __castguard_compat_check
    Discarded __castguard_check_failure_nop
    Discarded __castguard_check_failure_debugbreak
    Discarded __castguard_check_failure_fastfail
    Discarded __castguard_check_failure_os_handled
    Discarded __castguard_slow_path_compat_check
    Discarded __castguard_slow_path_check_debugbreak
    Discarded __castguard_slow_path_check_fastfail
    Discarded __castguard_slow_path_check_nop
    Discarded __castguard_slow_path_check_os_handled
    lld-link: Processing section .CRT$XCA -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 6

    lld-link: Processing section .CRT$XCIS -> .CRT

    lld-link:   C:\Library\Developer\Platforms\Windows.platform\Developer\SDKs\Windows.sdk\usr\lib\swift\windows\x86_64\swiftrt.obj, SectionID: 5

    lld-link: Processing section .CRT$XCZ -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 7

    lld-link: Processing section .CRT$XIA -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 4

    lld-link: Processing section .CRT$XIZ -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 5

    lld-link: Processing section .CRT$XPA -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 8

    lld-link: Processing section .CRT$XPZ -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 9

    lld-link: Processing section .CRT$XTA -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 10

    lld-link: Processing section .CRT$XTZ -> .CRT

    lld-link:   d:\a01\_work\12\s\Intermediate\vctools\msvcrt.nativeproj_110336922\objr\amd64\initializers.obj, SectionID: 11

    [7/7] Linking C:\dev\swift-scratchpad\ExampleLib\.build\x86_64-unknown-windows-msvc\debug\ExampleLib.dll
    Build complete! (6.97s)
</details>
