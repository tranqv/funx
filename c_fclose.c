////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   fclose - close a stream
   Returns: istat =
      0           if OK,
      EOF (= -1)  on error 
*/

void  c_fclose_ ( FILE **fp, int *istat )
{
   *istat = fclose ( *fp );
}

//

#include <stdint.h>

void  c_fclose_intref_ ( intptr_t *ifptr, int *istat )
{

// FILE *fp ;
// fp = (FILE *) (*ifptr)  ; 
// *istat = fclose ( fp );

// FILE *fp = (FILE *) (*ifptr)  ; 
// *istat = fclose ( fp );

   *istat = fclose ( (FILE *) (*ifptr) );
}


////////////////////////////////////////////////////////////////////////////////
/*
Ref: 
   ttps://pubs.opengroup.org/onlinepubs/9699919799/functions/fclose.html

#include <stdio.h>
   /usr/include/stdio.h

   int fclose ( FILE *stream ) ;

    The fclose() function shall cause the stream pointed to by stream to be flushed and the associated file to be closed. Any unwritten buffered data for the stream shall be written to the file; any unread buffered data shall be discarded. Whether or not the call succeeds, the stream shall be disassociated from the file and any buffer set by the setbuf() or setvbuf() function shall be disassociated from the stream. If the associated buffer was automatically allocated, it shall be deallocated.

    [CX] [Option Start] If the file is not already at EOF, and the file is one capable of seeking, the file offset of the underlying open file description shall be set to the file position of the stream if the stream is the active handle to the underlying file description.

    The fclose() function shall mark for update the last data modification and last file status change timestamps of the underlying file, if the stream was writable, and if buffered data remains that has not yet been written to the file. The fclose() function shall perform the equivalent of a close() on the file descriptor that is associated with the stream pointed to by stream. [Option End]

    After the call to fclose(), any use of stream results in undefined behavior.

RETURN VALUE

    Upon successful completion, fclose() shall return 0; otherwise, it shall return EOF [CX] [Option Start]  and set errno to indicate the error. [Option End]

ERRORS

    The fclose() function shall fail if:

    [EAGAIN]
        [CX] [Option Start] The O_NONBLOCK flag is set for the file descriptor underlying stream and the thread would be delayed in the write operation. [Option End]
    [EBADF]
        [CX] [Option Start] The file descriptor underlying stream is not valid. [Option End]
    [EFBIG]
        [CX] [Option Start] An attempt was made to write a file that exceeds the maximum file size. [Option End]
    [EFBIG]
        [XSI] [Option Start] An attempt was made to write a file that exceeds the file size limit of the process. [Option End]
    [EFBIG]
        [CX] [Option Start] The file is a regular file and an attempt was made to write at or beyond the offset maximum associated with the corresponding stream. [Option End]
    [EINTR]
        [CX] [Option Start] The fclose() function was interrupted by a signal. [Option End]
    [EIO]
        [CX] [Option Start] The process is a member of a background process group attempting to write to its controlling terminal, TOSTOP is set, the calling thread is not blocking SIGTTOU, the process is not ignoring SIGTTOU, and the process group of the process is orphaned. This error may also be returned under implementation-defined conditions. [Option End]
    [ENOMEM]
        [CX] [Option Start] The underlying stream was created by open_memstream() or open_wmemstream() and insufficient memory is available. [Option End]
    [ENOSPC]
        [CX] [Option Start] There was no free space remaining on the device containing the file or in the buffer used by the fmemopen() function. [Option End]
    [EPIPE]
        [CX] [Option Start] An attempt is made to write to a pipe or FIFO that is not open for reading by any process. A SIGPIPE signal shall also be sent to the thread. [Option End]

    The fclose() function may fail if:

    [ENXIO]
        [CX] [Option Start] A request was made of a nonexistent device, or the request was outside the capabilities of the device

*/
