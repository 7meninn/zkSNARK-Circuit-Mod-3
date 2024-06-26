# zkSNARK Circuit for Logical Operations

### Contract Address at Amoy Testnet : [0x159E0D41FF257c5c5619a34cd36525a4252D9F1A](https://amoy.polygonscan.com/address/0x159e0d41ff257c5c5619a34cd36525a4252d9f1a)

## Description

This project involves the design and implementation of a zkSNARK circuit that performs basic logical operations using the circom programming language. The circuit includes AND, OR, and NOT gates and combines them to produce a final output. A verifier smart contract is deployed on-chain to verify the proofs generated by this circuit.

## Features

* **Logical Operations**: The circuit implements AND, OR, and NOT gates to perform logical operations on input signals.
* **zkSNARK Proofs**: The circuit generates zkSNARK proofs for the logical operations, which can be verified on-chain using the deployed verifier contract.
* **On-Chain Verification**: The verifier smart contract deployed on-chain ensures that the proofs generated by the circuit are correct and valid.

## Getting Started

### Prerequisites

* Node.js and npm installed on your machine.
* Circom installed globally on your machine. Installation can be done using npm.
* Hardhat.

### Setting up the Project

1. **Clone the Repository**: Clone the project repository onto your local machine.
2. **Install Dependencies**: Install all required dependencies using `npm i`.

### Implementing the Circuit

[![Assessment-b05f6ed658.png](https://i.postimg.cc/65qGSg6N/Assessment-b05f6ed658.png)](https://postimg.cc/F7tRkPJP)

1. **Create the Circuit**: Use the circom programming language to design your circuit with logical operations.
#### In this case : -
```
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
```
* The inputs were A(0) and B(1) giving us Q(0)
2. **Compile the Circuit**: Compile the circuit using `npx hardhat circom`.
3. **Generate Witness**: Create witness data from the inputs to the circuit.
4. **Setup Ceremony**: Perform the trusted setup to generate proving and verification keys.
5. **Generate Proof**: Produce zkSNARK proofs using the compiled circuit and witness data.
6. **Verify Proof**: Use snarkjs or an equivalent tool to verify the generated proofs.
* 3 - 6 can be done by executing single file by using `npx hardhat run scripts/deploy.ts --network <choice>`

### Deploying the Verifier Contract

1. **Deploy the Contract**: Deploy the verifier smart contract to your preferred blockchain network.
2. **On-Chain Verification**: Use the deployed verifier contract to verify zkSNARK proofs on-chain.
* 1 - 2 is done using the previous command executed.

## Help

For any assistance or inquiries, please contact the author through [email.](mailto:bimaltyagi333@gmail.com).

## Author

* Bimal Tyagi

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
