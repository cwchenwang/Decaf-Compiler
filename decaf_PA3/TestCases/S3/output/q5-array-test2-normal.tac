VTABLE(_Main) {
    <empty>
    Main
}

FUNCTION(_Main_New) {
memo ''
_Main_New:
    _T0 = 4
    parm _T0
    _T1 =  call _Alloc
    _T2 = VTBL <_Main>
    *(_T1 + 0) = _T2
    return _T1
}

FUNCTION(main) {
memo ''
main:
    _T4 = 3
    _T5 = 2
    _T6 = 0
    _T7 = (_T5 < _T6)
    if (_T7 == 0) branch _L10
    _T8 = "Decaf runtime error: Cannot create negative-sized array\n"
    _T9 = "Decaf runtime error: The length of the created array should not be less than 0."
    parm _T9
    call _PrintString
    call _Halt
_L10:
    _T10 = 4
    _T11 = (_T10 * _T5)
    _T12 = (_T10 + _T11)
    parm _T12
    _T13 =  call _Alloc
    *(_T13 + 0) = _T5
    _T13 = (_T13 + _T12)
_L11:
    _T12 = (_T12 - _T10)
    if (_T12 == 0) branch _L12
    _T13 = (_T13 - _T10)
    *(_T13 + 0) = _T4
    branch _L11
_L12:
    _T3 = _T13
    _T15 = 2
    _T16 = 9
    _T18 = *(_T3 - 4)
    _T19 = 0
    _T20 = (_T15 < _T19)
    if (_T20 != 0) branch _L13
    _T21 = (_T15 < _T18)
    if (_T21 != 0) branch _L14
_L13:
    _T17 = _T16
    branch _L15
_L14:
    _T22 = 4
    _T23 = (_T22 * _T15)
    _T24 = (_T3 + _T23)
    _T25 = *(_T24 + 0)
    _T17 = _T25
    branch _L15
_L15:
    _T14 = _T17
    _T27 = 1
    _T28 = 1
    _T30 = *(_T3 - 4)
    _T31 = 0
    _T32 = (_T27 < _T31)
    if (_T32 != 0) branch _L16
    _T33 = (_T27 < _T30)
    if (_T33 != 0) branch _L17
_L16:
    _T29 = _T28
    branch _L18
_L17:
    _T34 = 4
    _T35 = (_T34 * _T27)
    _T36 = (_T3 + _T35)
    _T37 = *(_T36 + 0)
    _T29 = _T37
    branch _L18
_L18:
    _T26 = _T29
    parm _T14
    call _PrintInt
    parm _T26
    call _PrintInt
}

