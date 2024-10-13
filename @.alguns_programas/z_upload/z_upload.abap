REPORT z_upload.

INCLUDE: z_UPLOAD_top,
         z_UPLOAD_sel,
         z_UPLOAD_f01.

START-OF-SELECTION.

  PERFORM f_upload.

END-OF-SELECTION.