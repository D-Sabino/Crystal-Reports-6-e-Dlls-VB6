// ObjectWindows - (C) Copyright 1992 by Borland International

#ifndef __INPUTDIA_H
#define __INPUTDIA_H

#ifndef __DIALOG_H
#include <dialog.h>
#endif

#pragma option -Vo-
#if     defined(__BCOPT__) && !defined(_ALLOW_po)
#pragma option -po-
#endif

_CLASSDEF(TInputDialog)

  /* TInputDialog */
class _EXPORT TInputDialog : public TDialog
{
public:
    LPSTR Prompt;
    LPSTR Buffer;
    WORD BufferSize;

    TInputDialog(PTWindowsObject AParent, LPSTR ATitle,
              LPSTR APrompt, LPSTR ABuffer, WORD ABufferSize,
              PTModule AModule = NULL);
    void TransferData(WORD Direction);

#if !defined (NO_OBJECT_IO)
    static PTStreamable build();
#endif

protected:
    virtual void SetupWindow();
#if !defined (NO_OBJECT_IO)
    TInputDialog(StreamableInit) : TDialog(streamableInit) {};
    virtual void write (Ropstream os);
    virtual Pvoid read (Ripstream is);
#endif

private:
#if !defined (NO_OBJECT_IO)
    virtual const Pchar streamableName() const
        { return "TInputDialog"; }
#endif
};

#if !defined (NO_OBJECT_IO)
inline Ripstream operator >> ( Ripstream is, RTInputDialog cl )
    { return is >> (RTStreamable )cl; }
inline Ripstream operator >> ( Ripstream is, RPTInputDialog cl )
    { return is >> (RPvoid)cl; }

inline Ropstream operator << ( Ropstream os, RTInputDialog cl )
    { return os << (RTStreamable )cl; }
inline Ropstream operator << ( Ropstream os, PTInputDialog cl )
    { return os << (PTStreamable )cl; }
#endif

#pragma option -Vo.
#if     defined(__BCOPT__) && !defined(_ALLOW_po)
#pragma option -po.
#endif

#endif
