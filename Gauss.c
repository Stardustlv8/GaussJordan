#include <stdio.h>
#include <stdlib.h>

/*Input:
	in: input matrix
	out: output matrix
	rowFrom: specifies the row that will be added to rowTo
	rowTo: specifies the row the operation will be applied to
	c: the multiplier for the operation
	size: the size of the row

*/
void addScalarMultipleOfLine(float** in, float** out, int rowFrom, int rowTo, float c, int size){
	int i;
	for(i=0;i<size;++i){
		in[rowTo][i]+=c*in[rowFrom][i];
		out[rowTo][i]+=c*out[rowFrom][i];
	}
}

/*Input:
	in: row pointer in input matrix
	out: row pointer in output matrix
	c: number to divide by
	size: size of row
Optimization: multiply instead 

*/
void divideRowByConst(float* in, float* out, float c, int size){
	//printf("Const is: %f\n", c);
	int i;
	for(i=0;i<size;++i){
		in[i]/=c;
		out[i]/=c;
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
void swapRows(float** in, float** out, int row1, int row2, int size){
	float temp;
	int i;
	for(i=0;i<size;++i){
		temp=in[row1][i];
		in[row1][i]=in[row2][i];
		in[row2][i]=temp;
		temp=out[row1][i];
		out[row1][i]=out[row2][i];
		out[row2][i]=temp;
	}
}

void printMatrix(float** mat, int size){
	int i,j;
	for(i=0;i<size;++i){
		for(j=0;j<size;++j){
			printf("%f ",mat[i][j]);
		}
		printf("\n");
	}
}

float** GaussJordan(float** in, int size){
	float** out = (float**)malloc(sizeof(float*)*size);
	int i,j;	
	for(i=0;i<size;++i){
		out[i]=(float*)malloc(sizeof(float)*size);
		//potentially faster to write diagonal twice?
		//6x3 give fewer cache misses?
		for(j=0;j<size;++j){
			if(i==j){
				out[i][j]=1;
			}else{
				out[i][j]=0;
			}
		}
	}
	//printMatrix(out,size);
	fprintf(stderr,"Output matrix initialized to identity...\n");
	//Gauss Jordan method
	for(i=0;i<size;++i){
		if(in[i][i]==0){
			for(j=i+1;j<size;++j){
				if(in[j][i]==0){
					break;
				}
			}
			swapRows(in,out,i,j,size);
		}
		//printf("\nIn before division:\n");
		//printMatrix(in,size);
		divideRowByConst(in[i],out[i],in[i][i],size);
		for(j=0;j<size;++j){
			if(j==i){
				continue;
			}
			addScalarMultipleOfLine(in,out,i,j,-in[j][i],size);
		}
		//printf("In:\n");
		//printMatrix(in,size);
		//printf("Out:\n");
		//printMatrix(out,size);
	}
	return out;
}

int main(int argc, char** argv){
	float** test=(float**)malloc(sizeof(float*)*3);
	int i;
	for(i=0;i<3;++i){
		test[i]=(float*)malloc(sizeof(float)*3);
	}
	fprintf(stderr,"Memory allocated.\n");
	//{	{3,1,1},
	//			{2,4,7},
	//			{1,2,9}};
	test[0][0]=3.0;
	test[0][1]=1.0;
	test[0][2]=1.0;
	test[2][0]=1.0;
	test[1][0]=2.0;
	test[2][1]=2.0;
	test[1][1]=4.0;
	test[1][2]=7.0;
	test[2][2]=9.0;
	fprintf(stderr,"Input matrix initialized...\n");
	float** out = GaussJordan(test,3);
	printf("Final:\n");
	printMatrix(out,3);
	
}
