import math

def addr_decode(address,vector_len=18432):
    if vector_len > 512:
        bit_shift = int(math.ceil(math.log(float(vector_len)/512.0,2)))
    else:
        bit_shift = 1
    #print bit_shift
    #address = (2**20) + (2**29) +(2**13)
    out = dict()
    out['bank'] = (address & ((2**28) + (2**29)))>>28
    out['row'] =  (address & (  ((2**28)-1) - ((2**14)-1)  ))>>14
    out['rank'] = (address & (2**13))>>13
    out['col'] = (address & (  ((2**13)-1) - ((2**3)-1)  ))>>3
    out['block'] = out['bank'] + ((out['row']>>bit_shift) <<2) + (out['rank']<<10)
    #print bank,row,rank,col,block
    return out

def addr_encode(int_num=0,offset=0,vector_len=18432):
    if vector_len > 512:
        bit_shift = int(math.ceil(math.log(float(vector_len)/512.0,2)))
    else:
        bit_shift = 1

    block_row_bits = 14-bit_shift

    bank = int_num & 3
    block_row = (int_num >> 2) & ((2**block_row_bits)-1) 
    rank = (int_num>>(block_row_bits + 2))

    column = offset & ((2**9)-1)
    row_offset = (offset >> 9)

    address = (column << 4) + (rank<<13) + (row_offset << 14) + (block_row<<(14 + bit_shift)) + (bank << 28)
    
    #print bank,bit_shift, block_row, block_row_bits, rank, column, row_offset
    return address
