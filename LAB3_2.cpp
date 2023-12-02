#include <iostream>
#include <cmath>

int main() {
    double xmm6 = 0.5;
    double xmm0, xmm1;
    int rdx = 12;
    double r8 = -4;
    int r9d = 4;
    int rbx;
    double result;

    xmm0 = static_cast<double>(rdx);
    xmm0 *= r8;
    result = std::cos(xmm0);

    double xmm6_copy = xmm6;
    xmm6_copy = xmm0;
    xmm6 = xmm6_copy;

    rbx = r9d;
    rbx += r8;
    r8 = static_cast<double>(rbx);
    xmm0 = r8;
    result += std::sin(xmm0);

    xmm1 = 0;
    int comparison_result = std::signbit(result - xmm1);

    if (!(comparison_result <= 0)){
        std::cout << "Access granted" << std::endl;
    }
    return 0;
}