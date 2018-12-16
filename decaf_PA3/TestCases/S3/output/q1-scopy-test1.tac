VTABLE(_A) {
    <empty>
    A
    _A.seta;
    _A.getA;
}

VTABLE(_Father) {
    <empty>
    Father
    _Father.setfield;
    _Father.seta;
    _Father.setf;
    _Father.getf;
    _Father.getA;
}

VTABLE(_Main) {
    <empty>
    Main
}

FUNCTION(_A_New) {
memo ''
_A_New:
    _T11 = 8
    parm _T11
    _T12 =  call _Alloc
    _T13 = 0
    *(_T12 + 4) = _T13
    _T14 = VTBL <_A>
    *(_T12 + 0) = _T14
    return _T12
}

FUNCTION(_Father_New) {
memo ''
_Father_New:
    _T15 = 12
    parm _T15
    _T16 =  call _Alloc
    _T17 = 0
    *(_T16 + 4) = _T17
    *(_T16 + 8) = _T17
    _T18 = VTBL <_Father>
    *(_T16 + 0) = _T18
    return _T16
}

FUNCTION(_Main_New) {
memo ''
_Main_New:
    _T19 = 4
    parm _T19
    _T20 =  call _Alloc
    _T21 = VTBL <_Main>
    *(_T20 + 0) = _T21
    return _T20
}

FUNCTION(_A.seta) {
memo '_T0:4 _T1:8'
_A.seta:
    _T22 = *(_T0 + 4)
    *(_T0 + 4) = _T1
}

FUNCTION(_A.getA) {
memo '_T2:4'
_A.getA:
    _T23 = *(_T2 + 4)
    return _T23
}

FUNCTION(_Father.setfield) {
memo '_T3:4 _T4:8'
_Father.setfield:
    _T24 = *(_T3 + 4)
    *(_T3 + 4) = _T4
    _T25 = *(_T3 + 8)
    _T26 =  call _A_New
    *(_T3 + 8) = _T26
}

FUNCTION(_Father.seta) {
memo '_T5:4 _T6:8'
_Father.seta:
    _T27 = *(_T5 + 8)
    parm _T27
    parm _T6
    _T28 = *(_T27 + 0)
    _T29 = *(_T28 + 8)
    call _T29
}

FUNCTION(_Father.setf) {
memo '_T7:4 _T8:8'
_Father.setf:
    _T30 = *(_T7 + 4)
    *(_T7 + 4) = _T8
}

FUNCTION(_Father.getf) {
memo '_T9:4'
_Father.getf:
    _T31 = *(_T9 + 4)
    return _T31
}

FUNCTION(_Father.getA) {
memo '_T10:4'
_Father.getA:
    _T32 = *(_T10 + 8)
    parm _T32
    _T33 = *(_T32 + 0)
    _T34 = *(_T33 + 12)
    _T35 =  call _T34
}

FUNCTION(main) {
memo ''
main:
    _T38 =  call _Father_New
    _T37 = _T38
    _T39 = 5
    parm _T37
    parm _T39
    _T40 = *(_T37 + 0)
    _T41 = *(_T40 + 8)
    call _T41
    _T42 = 10
    parm _T37
    parm _T42
    _T43 = *(_T37 + 0)
    _T44 = *(_T43 + 12)
    call _T44
    _T45 = 12
    parm _T45
    _T46 =  call _Alloc
    _T36 = _T46
    _T47 = *(_T37 + 0)
    *(_T46 + 0) = _T47
    _T48 = *(_T37 + 4)
    *(_T46 + 4) = _T48
    _T49 = *(_T37 + 8)
    *(_T46 + 8) = _T49
    parm _T37
    _T50 = *(_T37 + 0)
    _T51 = *(_T50 + 24)
    _T52 =  call _T51
    parm _T52
    call _PrintInt
    parm _T36
    _T53 = *(_T36 + 0)
    _T54 = *(_T53 + 24)
    _T55 =  call _T54
    parm _T55
    call _PrintInt
    _T56 = 5
    parm _T37
    parm _T56
    _T57 = *(_T37 + 0)
    _T58 = *(_T57 + 12)
    call _T58
    parm _T37
    _T59 = *(_T37 + 0)
    _T60 = *(_T59 + 24)
    _T61 =  call _T60
    parm _T61
    call _PrintInt
    parm _T36
    _T62 = *(_T36 + 0)
    _T63 = *(_T62 + 24)
    _T64 =  call _T63
    parm _T64
    call _PrintInt
    _T65 = 8
    parm _T37
    parm _T65
    _T66 = *(_T37 + 0)
    _T67 = *(_T66 + 16)
    call _T67
    parm _T37
    _T68 = *(_T37 + 0)
    _T69 = *(_T68 + 20)
    _T70 =  call _T69
    parm _T70
    call _PrintInt
    parm _T36
    _T71 = *(_T36 + 0)
    _T72 = *(_T71 + 20)
    _T73 =  call _T72
    parm _T73
    call _PrintInt
}

