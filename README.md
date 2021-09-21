[MIT OCW - Performance Engineering of Software Systems: Lecture 1](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/lecture-videos/lecture-1-intro-and-matrix-multiplication/)

**Requirements:**
```
sudo apt update
sudo apt install clang
```

**Build & Run:** 
```
chmod a+x ./run.sh
./run.sh
```

Here's a run-time summary of each version in C Language.
**Version** | **Run Times** | **Description**
--- | --- | --- |
[Version 1](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/358f076cf1aa5849849b98ecb91a6a52dc3e0b51/matrix.c) | ~10 s  |
[Version 2](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/af5d8949b48510efc85f8ab8af597cddc2d5102e/matrix.c) | ~3 s   | Interchange loop order
[Version 3](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/c4a3f71000574e819e51cf7f5d5e54222b152118/matrix.c) | ~0.6 s | Compiler Optimization
[Version 4](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/main/matrix.c) | ~0.45 s | Parallelize Code

<table>
  <tr>
    <th><b>Version</b></th>
    <th><b>Run Times</b></th>
    <th><b>Description</b></th>
  </tr>
  <tr>
    <td><a href="https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/358f076cf1aa5849849b98ecb91a6a52dc3e0b51/matrix.c">Version 1</a></td>
    <td>~10 s</td>
    <td> - </td>
  </tr>
  <tr>
    <td><a href="https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/af5d8949b48510efc85f8ab8af597cddc2d5102e/matrix.c">Version 2</a></td>
    <td>~3 s</td>
    <td>Interchange loop order</td>
  </tr>
  <tr>
    <td><a href="https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/c4a3f71000574e819e51cf7f5d5e54222b152118/matrix.c">Version 3</a></td>
    <td>~0.6 s</td>
    <td>Compiler optimization</td>
  </tr>
  <tr>
    <td><a href="https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/main/matrix.c">Version 4</a></td>
    <td>~0.45 s</td>
    <td>Parallelize Code</td>
  </tr>
</table>

***Note**:
- Each version is the same matrix size, which is 1000 x 1000.
- It may give different run times on different computer!

Image below are matrices multiplication with the same matrix size in both of operand, like [`matrix.c`](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/2e3d2b5603f713850bc3d4910b87a871a6a72701/matrix.c#L6), but written in the Python programming language and **only** take advantage of CPU cache. \
![Image 1](https://user-images.githubusercontent.com/62495819/126493086-2c3c435a-1541-41e5-9d37-41eebc9294ab.png)

## Matrix Multiplication in VBA
In VBA, matrix 1000 x 1000 are only run in ~160 seconds, this is 2x faster than Python.
<div align="center">
  <img align="center" src="https://user-images.githubusercontent.com/62495819/127615972-56ee1836-eae1-4a92-a4f8-cb37c72f5fd5.PNG"/>
  <img align="center" src="https://user-images.githubusercontent.com/62495819/127616033-1725cf88-fc23-459e-8a11-8fd21c786346.PNG"/>
  <p align="center"><em>Unoptimized code</em></p>
</div>
Picture above are not optimized yet. Where I thought VBA are store Array in <a href="https://en.wikipedia.org/wiki/Row-_and_column-major_order">Row major order</a>. In fact, VBA Array are store in <b>Column Major Order</b>, so this is quite different with common Programming Language today (Python, C, C++, Java, etc.) where Array are store in <b>Row Major Order</b>. In order to improve VBA performance, we can change loop order to take advantage of CPU cache.
<br><br>
<div align="center">
  <img src="https://user-images.githubusercontent.com/62495819/127618759-42de1cf6-fb7f-4527-b73c-d42fe2b1ead9.PNG" />
  <img src="https://user-images.githubusercontent.com/62495819/127618762-7007b49d-3cfa-46bd-909e-46c0f9dedca8.PNG" />
  <p align="center"><em>Change loop order</em></p>
</div>
Performance are improved! 1.5x faster than before.
We can improve performance more fast, using <a href="https://docs.microsoft.com/en-us/troubleshoot/windows-client/deployment/dynamic-link-library">Dynamic link library (DLL)</a> to call C++ function/procedure from VBA.
<br><br>
<div align="center">
  <img src="https://user-images.githubusercontent.com/62495819/127621341-a0e22d78-96c3-4db1-862d-eac10ba3d6f6.PNG" />
  <img src="https://user-images.githubusercontent.com/62495819/127621361-cdeff681-cef6-43b5-830a-4bbd95dfcab2.PNG" />
  <p align="center"><em>Call C++ function from VBA</em></p>
</div>
We achieve performance <b>21x faster than before!</b> :fire:
We can optimize once again by using <a href="https://en.wikipedia.org/wiki/Optimizing_compiler">Compiler Optimization Technique</a>.
<br><br>
<div align="center">
  <img src="https://user-images.githubusercontent.com/62495819/127623703-4bcbcf03-6e04-493a-8c7a-c4a6af15ef20.PNG" />
  <img src="https://user-images.githubusercontent.com/62495819/127623764-dc61a6e7-670f-4f3e-b5c4-7625aadc815b.PNG" />
  <p align="center"><em>Using Compiler Optimization</em></p>
</div>
<p>Performance improve 5x faster :metal: So basically the last two optimization steps are just running C++ code :hand_over_mouth: But it doesn't matter, if we need matrix multiplication in Excel via VBA.</p>

## Conclusion
In conclusion, to improve performance:
- Use proper programming language, in this case if we want high speed, then use C/C++.
- Take advantage of CPU cache.
- Compiler optimization
- Of course... Data Structure & Algorithm
- Parallelize Code! (Actually, not all code can be parallelized effectively) 

I also apply matrix multiplication on my [blogspot](https://cs-informatika.blogspot.com/) (JavaScript). \
Other resource related to this repo: [High-Performance Matrix Multiplication](https://gist.github.com/nadavrot/5b35d44e8ba3dd718e595e40184d03f0)
