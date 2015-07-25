#include <stdio.h>
#include <stdlib.h>

typedef short int fixed;

/*Input:
	in: input matrix
	out: output matrix
	rowFrom: specifies the row that will be added to rowTo
	rowTo: specifies the row the operation will be applied to
	c: the multiplier for the operation
	size: the size of the row

*/
void addScalarMultipleOfLine(short int** in, fixed** out, int rowFrom, int rowTo, fixed c, int size) {
	
	int i;
	for(i = 0; i < size; ++i){
		in[rowTo][i] += c*in[rowFrom][i];
		out[rowTo][i] += c*out[rowFrom][i];
	}
}

/*Input:
	in: row pointer in input matrix
	out: row pointer in output matrix
	c: number to divide by
	size: size of row
Optimization: multiply instead 

*/
void divideRowByConst(short int* in, fixed* out, fixed c, int size) {
	
	int i;
	for(i = 0; i < size; ++i){
		in[i] /= c;
		out[i] /= c;
	}
}

/*Input:
	in: input matrix
	out: output matrix
	row1: first row to be swapped
	row2: second row to be swapped
	size: size of row

	Swaps all elements of row1 with the element in the same column in row2 for both in and out
*/
void swapRows(short int** in, fixed** out, int row1, int row2, int size) {
	
	short int temp;
	int i;
	for (i = 0; i < size; ++i) {
		temp = in[row1][i];
		in[row1][i] = in[row2][i];
		in[row2][i] = temp;
		temp = out[row1][i];
		out[row1][i] = out[row2][i];
		out[row2][i] = temp;
	}
}

void printMatrix(fixed** mat, int size) {
	
	int i,j;
	for (i = 0; i < size; ++i) {
		for (j = 0; j < size; ++j) {
			printf("%d.%d ", mat[i][j]>>3,(mat[i][j]%8)*125);
		}
		printf("\n");
	}
}

fixed** GaussJordan(short int** in, int size) {
	
	fixed** out = (fixed**) malloc(sizeof(fixed*) * size);
	
	int i,j;
	
	//Create identity matrix
	for (i=0;i<size;++i) {
		
		out[i] = (fixed*) malloc(sizeof(fixed) * size);
		
		//We are using 3 "decimal place" all numbers are scaled up by 2^3
		//Potentially faster to write diagonal twice?
		//6x3 give fewer cache misses?
		for (j = 0; j < size; ++j) {
			in[i][j]=in[i][j]<<3;
			if (i == j) {
				out[i][j] = 8;//1 shifted left 3
			} else {
				out[i][j] = 0;
			}
		}
	}
	fprintf(stderr,"Output matrix initialized to identity...\n");
	
	//Gauss Jordan method
	for (i = 0; i < size; ++i) {
		
		if (in[i][i] == 0) {
			for (j = i+1; j < size; ++j) {
				if (in[j][i] == 0) {
					break;
				}
			}
			swapRows(in, out, i, j, size);
		}
		//get to "1" which is represented by an 8
		divideRowByConst(in[i], out[i], (in[i][i])>>3, size);
		
		for (j = 0; j < size; ++j) {
			if (j == i) {
				continue;
			}
			addScalarMultipleOfLine(in, out, i, j, -in[j][i], size);
		}
	}
	return out;
}

int main(int argc, char** argv) {
	
	short int** test = (short int**) malloc(sizeof(short int*) * 3);
	
	int i;
	for (i = 0; i < 3; ++i) {
		test[i] = (short int*) malloc(sizeof(short int) * 3);
	}
	
	fprintf(stderr,"Memory allocated.\n");
	
	//{	{3,1,1},
	//	{2,4,7},
	//	{1,2,9} };
	
	test[0][0]=3;
	test[0][1]=1;
	test[0][2]=1;
	test[2][0]=1;
	test[1][0]=2;
	test[2][1]=2;
	test[1][1]=4;
	test[1][2]=7;
	test[2][2]=9;
	
	fprintf(stderr, "Input matrix initialized...\n");
	fixed** out = GaussJordan(test,3);
	printf("Final:\n");
	printMatrix(out, 3);
}
