# SVD-IC
Singular Value Decomposition based Image Compression

## Intro
A project that implements a form of image compression using singular value
decomposition of the image as a matrix. This project uses GNU Octave, which
is "drop-in compatible with many MATLAB scripts". The goal is for this to
be compatible with MATLAB.

## Setup
Install either GNU Octave or MATLAB. Instruction is provided for GNU Octave as
Octave is free and open source, whereas MATLAB requires a purchased license.

### GNU Octave
Download the installer appropriate for your platform [here](https://www.gnu.org/software/octave/#install).
Run the installer and proceed through the installation process (use the default
  options unless you have other needs).

Run GNU Octave and proceed through the "Welcome to Octave!" prompts. When that's
finished, Octave will open to a new *Command Window*.

### Project Setup
If you haven't already, clone this repository or download and extract it as an
archive.

Navigate to the root of the cloned/downloaded repository using the *File Browser*
window within the Octave program, to the left of the *Command Window*.


### Developer Notes
The gsvd function found in MATLAB and the Octave `linear-algebra` package are
slightly different. Notably, returned value order differs, requiring special
handling to ensure compatibility between MATLAB and Octave.

MATLAB
```matlab
[U,V,X,C,S] = gsvd(A,B)
```

Octave `linear-algebra`
```matlab
[u, v, c, s, x [, r]] = gsvd (a, b)
```
