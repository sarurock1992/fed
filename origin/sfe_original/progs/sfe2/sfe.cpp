/// 2013 12/5
/// Takeshi Nishida
/// 

#include "sfe.h"
#include "kf.h"

///////////////////////////////////////////////////
// main
///////////////////////////////////////////////////
#define TOTAL 1000
int main(int argc, char** argv)
{

#define NUM 20
#define Ts 0.01

  int cnt=0,k=0,i,j;

  CvRNG rng = cvRNG(-1);
  char code = -1;
  char buff[4000];
  char *pbuff;
  FILE *gp1,*fp,*fd;
  double *ex,*ep,w,kew;
  double z,tw,ew;
  double mu=NUM/(double)2;
  double sum1=0,sum2=0;
  static double sig=NUM*Ts/(double)16;
  double sig2,r;
  double check;
  double *data,*pew;

  sig2=sig*sig;
  printf("sigma=%lf  mu=%lf\n",sig,mu);

  data=(double*)malloc(TOTAL*sizeof(double));
  pew=(double*)malloc(TOTAL*sizeof(double));
  KFCreate(&kf,N,M);
  KFInit(&kf,sigv, sigw);

#define GNUPLOT
#ifdef GNUPLOT
  fp=fopen("err.dat","w");
  if(fp==NULL){
    fprintf(stderr,"Do not open error.dat");
    exit(EXIT_FAILURE);
  }

  gp1=popen("gnuplot -persist -geometry 500x300+510+380","w");
  if(gp1==NULL){
    fprintf(stderr, "Do Not Opne GNUPLOT");
    exit(EXIT_FAILURE);
  }
  fprintf(gp1,"set terminal x11 \n");
  fprintf(gp1,"set xrange [0:5000] \n");
  //fprintf(gp1,"set yrange [0:15] \n");
  fprintf(gp1,"set xlabel \"time\" \n");
  fprintf(gp1,"set ylabel \"estimated frequency\" \n");
  fflush(gp1);
#endif

  //// read data file /////////////
  fd=fopen("./ProfIzumi/022.csv","r");
  //fd=fopen("./ProfIzumi/02.csv","r");
  if(fd==NULL){
    fprintf(stderr,"Do not open data file");
    exit(EXIT_FAILURE);
  }

  for(i=0;i<TOTAL;i++){
    fgets(buff,4000,fd);
    sscanf(buff,"%d,%lf",&j,&data[i]);
    printf("%d %lf\n",i,data[i]);
  }
  fclose(fd);

  ex   =(double*)calloc(sizeof(double),NUM);
  ep   =(double*)calloc(sizeof(double),NUM);

  for(i=0;i<NUM;i++)
    ep[i]=exp(-pow((i-mu)*Ts,2)/(2*sig2))/sqrt(2*CV_PI*sig2);

  for(k=0;k<TOTAL;k++){
    z=data[k]; //measurement 
   
    if(k<NUM) ex[k]=z;
    else {for(i=1;i<NUM;i++) ex[i-1]=ex[i]; ex[NUM-1]=z;}
  
    for(sum1=0,sum2=0,i=0;i<NUM;i++){
      sum1+=ex[i]*ep[i]*pow((i-mu)*Ts,2);
      sum2+=ex[i]*ep[i];
    }
    check=sig2-sum1/sum2;
    //if(check>0 && sum2>1e-10)  ew=sqrt(check)/sig2;
    if(check>0)  ew=sqrt(check)/sig2;
    gsl_matrix_set(y,0,0,ew);

    KF(&kf,y);
    kew=gsl_matrix_get(kf.xc,0,0);

#ifdef GNUPLOT
    fprintf(fp,"%d %lf %lf %lf \n",k,ew,kew,data[k]);
    pew[k]=kew;
    if(k>NUM) fprintf(gp1, "plot '-' with steps linetype 1\n");
    for(i=0;i<k;i++) fprintf(gp1, "%f\n",pew[i]); 
    fprintf(gp1, "e\n");
    fflush(gp1);
#endif

    code = (char)cvWaitKey(10);
    if( code == 27 || code == 'q' || code == 'Q' )  break;
  }
  KFFree(&kf);
  fclose(fp);
  fclose(gp1);
  return 0;
}
