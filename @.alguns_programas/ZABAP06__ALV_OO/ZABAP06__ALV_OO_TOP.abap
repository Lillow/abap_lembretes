*&---------------------------------------------------------------------*
*& Include          ZABAP06__ALV_OO_TOP
*&---------------------------------------------------------------------*


tables: vbak.

types: BEGIN OF ty_vbak,
        vbeln type vbeln_va,
        auart type auart,
        erdat type erdat,
        erzet type erzet,
        ernam type ernam,
       end of ty_vbak.

types: tyb_vbak type table of ty_vbak.