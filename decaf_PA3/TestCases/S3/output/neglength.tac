VTABLE(_Main) {
    <empty>
    Main
    _Main.create;
}

FUNCTION(_Main_New) {
memo ''
_Main_New:
    _T2 = 8
    parm _T2
    _T3 =  call _Alloc
    _T4 = 0
    *(_T3 + 4) = _T4
    _T5 = VTBL <_Main>
    *(_T3 + 0) = _T5
    return _T3
}

FUNCTION(main) {
memo ''
main:
    _T6 =  call _Main_New
    _T7 = 1
    _T8 = - _T7
    parm _T6
    parm _T8
    _T9 = *(_T6 + 0)
    _T10 = *(_T9 + 8)
    call _T10
}

FUNCTION(_Main.create) {
memo '_T0:4 _T1:8'
_Main.create:
    _T11 = *(_T0 + 4)
    _T12 = 0
    _T13 = 0
    _T14 = (_T1 < _T13)
    if (_T14 == 0) branch _L11
    _T15 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm _T15
    call _PrintString
    call _Halt
_L11:
    _T16 = 4
    _T17 = (_T16 * _T1)
    _T18 = (_T16 + _T17)
    parm _T18
    _T19 =  call _Alloc
    *(_T19 + 0) = _T1
    _T19 = (_T19 + _T18)
_L12:
    _T18 = (_T18 - _T16)
    if (_T18 == 0) branch _L13
    _T19 = (_T19 - _T16)
    *(_T19 + 0) = _T12
    branch _L12
_L13:
    *(_T0 + 4) = _T19
}

