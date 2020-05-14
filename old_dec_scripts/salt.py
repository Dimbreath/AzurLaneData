from ctypes import *
import sys

uint_3 = [
    c_uint(494357436).value,
    c_uint(9879784).value,
    c_uint(6922892).value,
    c_uint(903531449).value,
    c_uint(6540994).value,
    c_uint(5925797).value,
    c_uint(345141550).value,
    c_uint(9625113).value,
    c_uint(746131).value,
    c_uint(64968262).value,
    c_uint(5268418).value,
    c_uint(7508949).value,
    c_uint(6183843).value,
    c_uint(818130891).value,
    c_uint(18654838).value,
    c_uint(7884461).value,
    c_uint(4962562).value,
    c_uint(4846732).value,
    c_uint(92354900).value
]

uint_1 = c_uint(2654435769).value

def decrypt_scripts(encrypted: bytes):
    scripts_in = bytearray(encrypted)
    scripts_out = scripts_in

    array = [0] * 2
    num = 0

    for num3 in range(0, len(scripts_in) - 8, 8):
        array[0] = c_uint(((scripts_in[num3 | 0] | (scripts_in[num3 | 1] << 8)) | (scripts_in[num3 | 2] << 16) | (scripts_in[num3 | 3] << 24))).value
        array[1] = c_uint(((scripts_in[num3 | 4] | (scripts_in[num3 | 5] << 8)) | (scripts_in[num3 | 6] << 16) | (scripts_in[num3 | 7] << 24))).value

        if num == 0:
            var2 = array[0]
            var3 = array[1]
            var4 = c_uint(uint_1 * 2).value
            var9 = 0

            while var9 < 2:
                var3 = c_uint(var3 - (((var2 << 4) + uint_3[2]) ^ (var2 + var4) ^ ((var2 >> 5) + uint_3[3]))).value
                var2 = c_uint(var2 - (((var3 << 4) + uint_3[0]) ^ (var3 + var4) ^ ((var3 >> 5) + uint_3[1]))).value
                var4 = c_uint(var4 - uint_1).value
                var9 = var9 + 1

            array[0] = var2
            array[1] = var3

        elif num == 1:
            var2 = array[0]
            var3 = array[1]
            var4 = c_uint(uint_1 * 2).value
            var5 = 0

            while var5 < 2:
                var3 = c_uint(var3 - ((((var2 << 4) ^ (var2 >> 5)) + var2) ^ (var4 + uint_3[(var4 >> 11) & 3]))).value
                var4 = c_uint(var4 - uint_1).value
                var2 = c_uint(var2 - ((((var3 << 4) ^ (var3 >> 5)) + var3) ^ (var4 + uint_3[var4 & 3]))).value
                var5 = var5 + 1 

            array[0] = var2
            array[1] = var3
    
        elif num == 2:
            var = len(array)
            var2 = 2
            var3 = c_uint(2 * uint_1).value
            var4 = array[0]

            while var2 != 0:
                var2 = var2 - 1
                var5 = (var3 >> 2) & 3
                var7 = 0

                for var6 in range(var - 1, 0, -1):
                    var7 = array[var6 - 1]
                    array[var6] = c_uint(array[var6] - ((((var7 >> 5) ^ (var4 << 2)) + ((var4 >> 3) ^ (var7 << 4))) ^ ((var3 ^ var4) + (uint_3[(var6 & 3) ^ var5] ^ var7)))).value
                    var4 = array[var6]
                    var6 = var6 - 1
                
                var7 = array[var - 1]
                array[0] = c_uint(array[0] - ((((var7 >> 5) ^ (var4 << 2)) + ((var4 >> 3) ^ (var7 << 4))) ^ ((var3 ^ var4) + (uint_3[(var6 & 3) ^ var5] ^ var7)))).value
                var4 = array[0]
                var3 = c_uint(var3 - uint_1).value

        else:
            # 12 -> 13
            array[0] = c_uint((array[0] ^ uint_3[13] ^ num3)).value
            array[1] = c_uint((array[1] ^ uint_3[2] ^ num3)).value

        bytes_1 = c_uint(array[0]).value.to_bytes(4, byteorder=sys.byteorder)
        bytes_2 = c_uint(array[1]).value.to_bytes(4, byteorder=sys.byteorder)

        scripts_out[num3 | 0] = bytes_1[0]
        scripts_out[num3 | 1] = bytes_1[1]
        scripts_out[num3 | 2] = bytes_1[2]
        scripts_out[num3 | 3] = bytes_1[3]

        scripts_out[num3 | 4] = bytes_2[0]
        scripts_out[num3 | 5] = bytes_2[1]
        scripts_out[num3 | 6] = bytes_2[2]
        scripts_out[num3 | 7] = bytes_2[3]

        num = (num + 1) % 4
    
    return scripts_out