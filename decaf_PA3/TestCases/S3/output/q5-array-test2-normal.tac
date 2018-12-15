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
    _T17 = *(_T3 - 4)
    _T18 = 0
    _T19 = (_T15 < _T18)
    if (_T19 != 0) branch _L13
    _T20 = (_T15 < _T17)
    if (_T20 == 0) branch _L13
_L14:
    _T21 = 4
    _T22 = (_T21 * _T15)
    _T23 = (_T3 + _T22)
    _T24 = *(_T23 + 0)
    branch _L15
_L13:
    _T24 = _T16
_L15:
    _T14 = _T24
    _T26 = 1
    _T27 = 1
    _T28 = *(_T3 - 4)
    _T29 = 0
    _T30 = (_T26 < _T29)
    if (_T30 != 0) branch _L16
    _T31 = (_T26 < _T28)
    if (_T31 == 0) branch _L16
_L17:
    _T32 = 4
    _T33 = (_T32 * _T26)
    _T34 = (_T3 + _T33)
    _T35 = *(_T34 + 0)
    branch _L18
_L16:
    _T35 = _T27
_L18:
    _T25 = _T35
    parm _T14
    call _PrintInt
    parm _T25
    call _PrintInt
}

