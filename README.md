[MIT OCW - Performance Engineering of Software Systems: Lecture 1](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/lecture-videos/lecture-1-intro-and-matrix-multiplication/)

**Build & Run:** 
```
chmod a+x ./run.sh
./run.sh
```

Take a look at the commit history, but here's a run-time summary of each version.
**Version** | **Run Times**
--- | --- | 
[Version 1](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/358f076cf1aa5849849b98ecb91a6a52dc3e0b51/matrix.c) | ~10 s 
[Version 2](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/af5d8949b48510efc85f8ab8af597cddc2d5102e/matrix.c) | ~3 s 
[Version 3](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/c4a3f71000574e819e51cf7f5d5e54222b152118/matrix.c) | ~0.6 s
[Version 4](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/main/matrix.c) | ~0.45 s

***Note**:
- Each version is the same matrix size, which is 1000 x 1000.
- It may give different run times on different computer!

Image below are matrices multiplication with the same matrix size in both of operand, like [`matrix.c`](https://github.com/afifabroory/MatrixMultiplication-Performance-Engineering/blob/2e3d2b5603f713850bc3d4910b87a871a6a72701/matrix.c#L6), but written in the Python programming language and **only** take advantage of CPU cache. \
![Image 1](https://user-images.githubusercontent.com/62495819/126493086-2c3c435a-1541-41e5-9d37-41eebc9294ab.png)

In conclusion, to improve performance:
- Use proper programming language, in this case if we want high speed, then use C.
- Take advantage of CPU cache.
- Compiler optimization
- Of course... Data Structure & Algorithm
- Parallelize Code! (Actually, not all code can be parallelized effectively)
