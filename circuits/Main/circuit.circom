pragma circom 2.0.0;

template Main() {  

   // component gates used to 
   component and = andGate();
   component not = notGate();
   component or = orGate();

   // signal inputs
   signal input A;
   signal input B;
   // signals from gates
   signal X;
   signal Y;
   // final signal output
   signal output Q;

   // circuit logic
   and.a <== A;
   and.b <== B;
   X <== and.out;
   not.in <== B;
   Y <== not.out;
   or.a <== X;
   or.b <== Y;
   Q <== or.out;
}

// Gates Definition

template andGate() {
   // signal inputs
    signal input a;
    signal input b;
   // final output
    signal output out;

    out <== a*b;
}

template orGate() {
   // signal inputs
    signal input a;
    signal input b;
   // final output
    signal output out;

    out <== a + b - a*b;
}

template notGate() {
   // signal inputs
    signal input in;
    signal output out;
   // final output
    out <== 1 + in - 2*in;
}

component main = Main();