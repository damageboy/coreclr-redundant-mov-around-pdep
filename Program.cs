using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using static System.Runtime.Intrinsics.X86.Avx;
using static System.Runtime.Intrinsics.X86.Avx2;
using static System.Runtime.Intrinsics.X86.Popcnt.X64;
using static System.Runtime.Intrinsics.X86.Bmi2.X64;


namespace superfluous_mov
{
    class Program
    {
        static unsafe void Main(string[] args)
        {
            Console.WriteLine(BugBugBug());
	    Console.ReadLine();
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        unsafe static ulong BugBugBug()
        {
            var N = Vector256<int>.Count;
            var P = Vector256.Create(100);

            var e1 = P.AsUInt64().GetElement(0);
            var e0 = (uint) e1;
            e1 >>= 32;
            var e3 = P.AsUInt64().GetElement(1);
            var e2 = (uint) e3;
            e3 >>= 32;
            var tmp = ExtractVector128(P, 1);
            var e5 = tmp.AsUInt64().GetElement(0);
            var e4 = (uint) e5;
            e5 >>= 32;
            var e7 = tmp.AsUInt64().GetElement(1);
            var e6 = (uint) e7;
            e7 >>= 32;

            var p0 = ParallelBitDeposit((uint) e0, 0x0707070707070707);
            var p1 = ParallelBitDeposit((uint) e1, 0x0707070707070707);
            var p2 = ParallelBitDeposit((uint) e2, 0x0707070707070707);
            var p3 = ParallelBitDeposit((uint) e3, 0x0707070707070707);
            var p4 = ParallelBitDeposit((uint) e4, 0x0707070707070707);
            var p5 = ParallelBitDeposit((uint) e5, 0x0707070707070707);
            var p6 = ParallelBitDeposit((uint) e6, 0x0707070707070707);
            var p7 = ParallelBitDeposit((uint) e7, 0x0707070707070707);

	    return p0+p1+p2+p3+p4+p5+p6+p7;
        }
    }
}
