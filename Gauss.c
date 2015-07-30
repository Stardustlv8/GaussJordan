#include <stdio.h>
#include <stdlib.h>

#define DECIMAL_PLACES	8
#define ONE		(1<<DECIMAL_PLACES)

typedef int fixed;

// Note: only used for printing
inline fixed mod(fixed x,int m){
	if(x<0) x*=-1;
	return x%m;
}

// Shift down n bits with rounding (instead of truncation)
inline int shiftDown(int x, int n) {
	return (x+(1<<(n-1))>>n);
}

/*Input:
	in: input matrix
	out: output matrix
	rowFrom: specifies the row that will be added to rowTo
	rowTo: specifies the row the operation will be applied to
	c: the multiplier for the operation
	size: the size of the row

*/
void addScalarMultipleOfLine(fixed** in, fixed** out, int rowFrom, int rowTo, fixed c, int size) {

	int i;
	
	for (i = size-1; i > 0; i-=2) {
		in[rowTo][i] += shiftDown((c*in[rowFrom][i]), DECIMAL_PLACES);
		out[rowTo][i] += shiftDown((c*out[rowFrom][i]), DECIMAL_PLACES);

		in[rowTo][i-1] += shiftDown((c*in[rowFrom][i-1]), DECIMAL_PLACES);
		out[rowTo][i-1] += shiftDown((c*out[rowFrom][i-1]), DECIMAL_PLACES);
	}
}

/*Input:
	in: row pointer in input matrix
	out: row pointer in output matrix
	c: number to divide by
	size: size of row

*/
void divideRowByConst(fixed* in, fixed* out, fixed c, int size) {
	
	int i;
	for(i = 0; i < size; ++i){
		in[i] = (in[i] + shiftDown(c, 1)) / c;
		out[i] = (out[i] + shiftDown(c, 1)) / c;
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
void swapRows(fixed** in, fixed** out, int row1, int row2, int size) {
	
	fixed temp;
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

// Note: only used for printing
void printMatrix(fixed** mat, int size) {
	
	int i,j;
	for (i = 0; i < size; ++i) {
	
		for (j = 0; j < size; ++j) {
		
			if (mat[i][j] < 0 && mat[i][j] > -ONE) printf("-");
			
			printf("%d.%08d\t", mat[i][j] / ONE, mod(mat[i][j], ONE) * 390265);
		}
		printf("\n");
	}
}

fixed** GaussJordan(fixed** in, int size) {
	
	fixed** out = (fixed**) malloc(sizeof(fixed*) * size);
	
	int i,j;
	
	//Create identity matrix
	for (i=0;i<size;++i) {
		
		out[i] = (fixed*) malloc(sizeof(fixed) * size);
		
		//We are using 8 "decimal place" all numbers are scaled up by 2^8
		for (j = 0; j < size; ++j) {
			if (i == j) {
				out[i][j] = ONE; //1 shifted left 8
			} else {
				out[i][j] = 0;
			}
		}
	}
	
	//Gauss Jordan method
	for (i = 0; i < size; ++i) {
		
		if (in[i][i] == 0) {
			for (j = i+1; j < size; ++j) {
				if (in[j][i] != 0) {
					break;
				}
			}
			if(j>=size){
				fprintf(stderr, "Matrix is not invertible.\n");
				exit(1);
			}
			swapRows(in, out, i, j, size);
		}
	
		for (j = 0; j < size; ++j) {
		
			if (j == i) {
				continue;
			}
			
			fixed denom = shiftDown(in[i][i], DECIMAL_PLACES);
			
			if (denom != 0) {
			
			    fixed coeff = -(in[j][i] + shiftDown(denom, 1)) / denom;
			    addScalarMultipleOfLine(in, out, i, j, coeff, size);
			    
			} else {
			    
			    fprintf(stderr, "Divide by zero error\n");
			    exit(1);
			}
		}
	}

	for(i=0; i<size; ++i){
		divideRowByConst(in[i], out[i], shiftDown(in[i][i],DECIMAL_PLACES), size);
	}

	return out;
}

int main(int argc, char** argv) {

	//Perform 4x4 matrix inversion
	const int matrixSize1 = 4;
	
	fixed** test = (fixed**) malloc(sizeof(fixed*) * matrixSize1);
	
	int i;
	for (i = 0; i < matrixSize1; ++i) {
		test[i] = (fixed*) malloc(sizeof(fixed) * matrixSize1);
	}
	
	printf("Memory allocated.\n");
	
	/*
	{   {3,1,1,-24},
		{2,4,7,70},
		{1,2,9,9},
		{70,-20,23,9}   }
	*/
	
	test[0][0] = 3 << DECIMAL_PLACES;
	test[0][1] = 1 << DECIMAL_PLACES;
	test[0][2] = 1 << DECIMAL_PLACES;
	test[0][3] = -24 << DECIMAL_PLACES;
	test[1][0] = 2 << DECIMAL_PLACES;
	test[1][1] = 4 << DECIMAL_PLACES;
	test[1][2] = 7 << DECIMAL_PLACES;
	test[1][3] = 70 << DECIMAL_PLACES;
	test[2][0] = 1 << DECIMAL_PLACES;
	test[2][1] = 2 << DECIMAL_PLACES;
	test[2][2] = 9 << DECIMAL_PLACES;
	test[2][3] = 9 << DECIMAL_PLACES;
	test[3][0] = 70 << DECIMAL_PLACES;
	test[3][1] = -20 << DECIMAL_PLACES;
	test[3][2] = 23 << DECIMAL_PLACES;
	test[3][3] = 9 << DECIMAL_PLACES;
	
	fixed** out1 = GaussJordan(test, matrixSize1);
	
	printf("4x4:\n");
	printMatrix(out1, matrixSize1);
	
	
	//Perform 8x8 matrix inversion
	const int matrixSize2 = 8;
	
	fixed** test8x8 = (fixed**)malloc(sizeof(fixed*) * matrixSize2);
	
	for (i = 0; i < matrixSize2; ++i) {
		test8x8[i] = (fixed*) malloc(sizeof(fixed) * matrixSize2);
	}
	
	printf("Memory allocated.\n");
	
	/*
	{   {1, 2, 7, -2, 5, 9, -8, 3},
	    {15, 4, 0, 3, -8, 2, 5, 11},
	    {15, 7, 0, 9, -1, -2, 6, 6},
	    {23, 7, 1, 1, 1, 9, 7, 9},
	    {-18, 23, 2, 2, 7, 9, 4, 4},
	    {21, 12, 1, 2, 8, 5, 1, 0},
	    {1, 2, 1, 2, 1, 2, 1, 2},
	    {1, 9, 1, -2, 5, 4, 1, -7}   }
	*/
	
	test8x8[0][0] = 1 << DECIMAL_PLACES;
	test8x8[0][1] = 2 << DECIMAL_PLACES;
	test8x8[0][2] = 7 << DECIMAL_PLACES;
	test8x8[0][3] = -2 << DECIMAL_PLACES;
	test8x8[0][4] = 5 << DECIMAL_PLACES;
	test8x8[0][5] = 9 << DECIMAL_PLACES;
	test8x8[0][6] = -8 << DECIMAL_PLACES;
	test8x8[0][7] = 3 << DECIMAL_PLACES;
	
	test8x8[1][0] = 15 << DECIMAL_PLACES;
	test8x8[1][1] = 4 << DECIMAL_PLACES;
	test8x8[1][2] = 0 << DECIMAL_PLACES;
	test8x8[1][3] = 3 << DECIMAL_PLACES;
	test8x8[1][4] = -8 << DECIMAL_PLACES;
	test8x8[1][5] = 2 << DECIMAL_PLACES;
	test8x8[1][6] = 5 << DECIMAL_PLACES;
	test8x8[1][7] = 11 << DECIMAL_PLACES;
	
	test8x8[2][0] = 15 << DECIMAL_PLACES;
	test8x8[2][1] = 7 << DECIMAL_PLACES;
	test8x8[2][2] = 0 << DECIMAL_PLACES;
	test8x8[2][3] = 9 << DECIMAL_PLACES;
	test8x8[2][4] = -1 << DECIMAL_PLACES;
	test8x8[2][5] = -2 << DECIMAL_PLACES;
	test8x8[2][6] = 6 << DECIMAL_PLACES;
	test8x8[2][7] = 6 << DECIMAL_PLACES;
	
	test8x8[3][0] = 23 << DECIMAL_PLACES;
	test8x8[3][1] = 7 << DECIMAL_PLACES;
	test8x8[3][2] = 1 << DECIMAL_PLACES;
	test8x8[3][3] = 1 << DECIMAL_PLACES;
	test8x8[3][4] = 1 << DECIMAL_PLACES;
	test8x8[3][5] = 9 << DECIMAL_PLACES;
	test8x8[3][6] = 7 << DECIMAL_PLACES;
	test8x8[3][7] = 9 << DECIMAL_PLACES;
	
	test8x8[4][0] = -18 << DECIMAL_PLACES;
	test8x8[4][1] = 23 << DECIMAL_PLACES;
	test8x8[4][2] = 2 << DECIMAL_PLACES;
	test8x8[4][3] = 2 << DECIMAL_PLACES;
	test8x8[4][4] = 7 << DECIMAL_PLACES;
	test8x8[4][5] = 9 << DECIMAL_PLACES;
	test8x8[4][6] = 4 << DECIMAL_PLACES;
	test8x8[4][7] = 4 << DECIMAL_PLACES;
	
	test8x8[5][0] = 21 << DECIMAL_PLACES;
	test8x8[5][1] = 12 << DECIMAL_PLACES;
	test8x8[5][2] = 1 << DECIMAL_PLACES;
	test8x8[5][3] = 2 << DECIMAL_PLACES;
	test8x8[5][4] = 8 << DECIMAL_PLACES;
	test8x8[5][5] = 5 << DECIMAL_PLACES;
	test8x8[5][6] = 1 << DECIMAL_PLACES;
	test8x8[5][7] = 0 << DECIMAL_PLACES;
	
	test8x8[6][0] = 1 << DECIMAL_PLACES;
	test8x8[6][1] = 2 << DECIMAL_PLACES;
	test8x8[6][2] = 1 << DECIMAL_PLACES;
	test8x8[6][3] = 2 << DECIMAL_PLACES;
	test8x8[6][4] = 1 << DECIMAL_PLACES;
	test8x8[6][5] = 2 << DECIMAL_PLACES;
	test8x8[6][6] = 1 << DECIMAL_PLACES;
	test8x8[6][7] = 2 << DECIMAL_PLACES;
	
	test8x8[7][0] = 1 << DECIMAL_PLACES;
	test8x8[7][1] = 9 << DECIMAL_PLACES;
	test8x8[7][2] = 1 << DECIMAL_PLACES;
	test8x8[7][3] = -2 << DECIMAL_PLACES;
	test8x8[7][4] = 5 << DECIMAL_PLACES;
	test8x8[7][5] = 4 << DECIMAL_PLACES;
	test8x8[7][6] = 1 << DECIMAL_PLACES;
	test8x8[7][7] = -7 << DECIMAL_PLACES;

	fixed** out2 = GaussJordan(test8x8, matrixSize2);
	
	printf("8x8:\n");
	printMatrix(out2, matrixSize2);
}
