# x86 Assembly Language Programming - Lab 4  

## Overview  
This project is an x86 Assembly Language program that processes student names and grades. It initializes a table of ten students with their respective numerical grades, sorts them in descending order, assigns letter grades, and prints the results.  

## Requirements  
To complete this lab, you will need:  

- **Microsoft Visual Studio** (Available through KSU UITS Software, CCSE Tutoring Center computers, or Virtual Machine)  
- **Irvine32 Library** (Provided by Kip Irvine)  
- **x86 Assembly Language Knowledge**  

### Helpful Resources  
1. [Setting up Visual Studio for x86 Assembly](http://asmirvine.com/gettingStartedVS2022/index.htm)  
2. [Irvine32 Library GitHub](https://github.com/Eazybright/Irvine32)  
3. [Kip Irvine Video Tutorials](https://media.pearsoncmg.com/ph/esm/ecs_irvine_x86_8/cw/#videonotes)  
4. [Assembly Language Basics](https://www.youtube.com/watch?v=5Eeq1xJVrx4)  
5. [Sorting in Assembly](https://www.youtube.com/watch?v=1CgsMtUmVgs&t=3s)  

## Features Implemented  
### 1. **Initialize Student Data**  
- Hardcoded an array of 10 student names.  
- Assigned corresponding numerical grades.  

### 2. **Sorting (Selection Sort)**  
- Implemented Selection Sort to sort students in descending order by their grades.  
- Ensured names and grades remain correctly paired during sorting.  

### 3. **Assigning Letter Grades**  
- Converted numerical grades into letter grades based on the scale:  
  - 90+ → A  
  - 80+ → B  
  - 70+ → C  
  - 60+ → D  
  - Below 60 → F  

### 4. **Grade Count Display**  
- Counted the number of each letter grade.  
- Printed the counts in **A-B-C-D-F** order as a single number (e.g., "34102").  

### 5. **Display Results**  
- Printed the sorted table of student names and grades.  

## How to Run  
1. **Set up Visual Studio with Irvine32 library**  
   - Follow [this guide](http://asmirvine.com/gettingStartedVS2022/index.htm) to configure your environment.  

2. **Compile & Execute**  
   - Open the `.asm` file in Visual Studio.  
   - Assemble the code and run the program.  

3. **Expected Output**  
   - Displays the **unsorted** list of student names and grades.  
   - Prints the **sorted** list (highest grade first).  
   - Displays the letter grade count as a five-digit number.  

## Code Structure  
- **Data Segment**: Stores student names and grades.  
- **Code Segment**:  
  - Implements sorting.  
  - Converts numerical grades to letter grades.  
  - Counts and displays the grade distribution.  

## Example Output  
'''vs
  Unsorted List: Caroline 40 Constant 30 Wyatt 100 ...
  Sorted List: Wyatt 100 Liz 95 Meg 90 ...
  Grade Count: 34102
'''

## **Contributors**  
- Caroline Varner
- Course: CS 3503 - Computer Organization and Architecture 
- Instructor: Waqas Majeed
- University: Kennesaw State University
