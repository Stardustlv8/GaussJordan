#include <stdio.h>
#include <stdlib.h>

#define DECIMAL_PLACES	3
#define ONE		(1<<DECIMAL_PLACES)

typedef short fixed;


inline fixed mod(fixed x,int m){
	if(x<0) x*=-1;
	return x%m;
}


inline int shiftDown(int x, int n) {
	return (x+(1<<(n-1))>>n);
	/*if ((x >> (n-1)) % 2 == 0) {
		return (x >> n);
	} else {
		return (x >> n)+1;
	}*/
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
	//printf("c: %d, rowFrom: %d, rowTo: %d\n",c,rowFrom,rowTo);
	int i;
	for(i = size-1; i > 0; i-=2) {
	//for(i = 1; i < size; i+=2){
                //temp = c*in[rowFrom][i];
		in[rowTo][i] += shiftDown((c*in[rowFrom][i]), DECIMAL_PLACES);
                //temp = shiftDown( temp, DECIMAL_PLACES);
               // in[rowTo][i] = temp;
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

void printMatrix(fixed** mat, int size) {
	
	int i,j;
	for (i = 0; i < size; ++i) {
		for (j = 0; j < size; ++j) {
			printf("%d(", mat[i][j]);
			if(mat[i][j]<0&&mat[i][j]>-ONE) printf("-");
			printf("%d.%d) ", mat[i][j]/ONE,mod(mat[i][j],ONE)*125);	//find define if possible
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
		
		//We are using 3 "decimal place" all numbers are scaled up by 2^3
		//Potentially faster to write diagonal twice?
		//6x3 give fewer cache misses?
		for (j = 0; j < size; ++j) {
			if (i == j) {
				out[i][j] = ONE;//1 shifted left 3
			} else {
				out[i][j] = 0;
			}
		}
	}
	//fprintf(stderr,"Output matrix initialized to identity...\n");
	
	//Gauss Jordan method
	for (i = 0; i < size; ++i) {
		
		if (in[i][i] == 0) {
			for (j = i+1; j < size; ++j) {
				if (in[j][i] != 0) {
					break;
				}
			}
			if(j==size){
				fprintf(stderr, "Matrix is not invertible.\n");
				exit(1);
			}
			swapRows(in, out, i, j, size);
		}
	
		for (j = 0; j < size; ++j) {
			if (j == i) {
				continue;
			}
			//printMatrix(out,size);
			//printf("\n");
			fixed coeff = -(in[j][i]/shiftDown(in[i][i],DECIMAL_PLACES));
			addScalarMultipleOfLine(in, out, i, j, coeff, size);
		}
	}

	for(i=0; i<size; ++i){
		divideRowByConst(in[i], out[i], shiftDown(in[i][i],DECIMAL_PLACES), size);
	}

	return out;
}

int main(int argc, char** argv) {

	const short matrixSize = 4;
	
	fixed** test = (fixed**) malloc(sizeof(fixed*) * matrixSize);
	
	int i;
	for (i = 0; i < matrixSize; ++i) {
		test[i] = (fixed*) malloc(sizeof(fixed) * matrixSize);
	}
	
	fprintf(stderr,"Memory allocated.\n");
	
	//{	{3,1,1},
	//	{2,4,7},
	//	{1,2,9} };
	
	/*test[0][0] = 3 << DECIMAL_PLACES;
	test[0][1] = 1 << DECIMAL_PLACES;
	test[0][2] = 1 << DECIMAL_PLACES;
	test[1][0] = 2 << DECIMAL_PLACES;
	test[1][1] = 4 << DECIMAL_PLACES;
	test[1][2] = 7 << DECIMAL_PLACES;
	test[2][0] = 1 << DECIMAL_PLACES;
	test[2][1] = 2 << DECIMAL_PLACES;
	test[2][2] = 9 << DECIMAL_PLACES;*/
	
	//{	{3,1,1,234},
	//	{2,4,7,70},
	//	{1,2,9,9},
	//	{70,220,23,9} };
	
	/*test[0][0] = 3 << DECIMAL_PLACES;
	test[0][1] = 1 << DECIMAL_PLACES;
	test[0][2] = 1 << DECIMAL_PLACES;
	test[0][3] = 234 << DECIMAL_PLACES;
	test[1][0] = 2 << DECIMAL_PLACES;
	test[1][1] = 4 << DECIMAL_PLACES;
	test[1][2] = 7 << DECIMAL_PLACES;
	test[1][3] = 70 << DECIMAL_PLACES;
	test[2][0] = 1 << DECIMAL_PLACES;
	test[2][1] = 2 << DECIMAL_PLACES;
	test[2][2] = 9 << DECIMAL_PLACES;
	test[2][3] = 9 << DECIMAL_PLACES;
	test[3][0] = 70 << DECIMAL_PLACES;
	test[3][1] = 220 << DECIMAL_PLACES;
	test[3][2] = 23 << DECIMAL_PLACES;
	test[3][3] = 9 << DECIMAL_PLACES;
	
	fixed** out = GaussJordan(test, matrixSize);*/
	
	fixed** out;
	
	int a;
	for (a = 0; a < 1000000; a++) {
	
		test[0][0] = 3 << DECIMAL_PLACES;
		test[0][1] = 1 << DECIMAL_PLACES;
		test[0][2] = 1 << DECIMAL_PLACES;
		test[0][3] = 234 << DECIMAL_PLACES;
		test[1][0] = 2 << DECIMAL_PLACES;
		test[1][1] = 4 << DECIMAL_PLACES;
		test[1][2] = 7 << DECIMAL_PLACES;
		test[1][3] = 70 << DECIMAL_PLACES;
		test[2][0] = 1 << DECIMAL_PLACES;
		test[2][1] = 2 << DECIMAL_PLACES;
		test[2][2] = 9 << DECIMAL_PLACES;
		test[2][3] = 9 << DECIMAL_PLACES;
		test[3][0] = 70 << DECIMAL_PLACES;
		test[3][1] = 220 << DECIMAL_PLACES;
		test[3][2] = 23 << DECIMAL_PLACES;
		test[3][3] = 9 << DECIMAL_PLACES;
	
		out = GaussJordan(test, matrixSize);
	}
	
	fprintf(stderr, "Input matrix initialized...\n");
	
	printf("Final:\n");
	printMatrix(out, matrixSize);
}
