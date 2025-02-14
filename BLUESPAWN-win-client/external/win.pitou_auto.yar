rule win_pitou_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.pitou."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pitou"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { ac 8bda c1e305 03c3 8bda c1eb02 }
            // n = 6, score = 700
            //   ac                   | mov                 edx, dword ptr [ebp - 0x24]
            //   8bda                 | push                edx
            //   c1e305               | mov                 eax, dword ptr [ebp - 0x1c]
            //   03c3                 | mov                 dword ptr [eax + 8], 0
            //   8bda                 | mov                 ecx, dword ptr [ebp - 0x1c]
            //   c1eb02               | mov                 edx, dword ptr [ebp - 0x24]

        $sequence_1 = { 80f457 8acc 80e103 8aec c0ed03 }
            // n = 5, score = 700
            //   80f457               | push                eax
            //   8acc                 | call                ebx
            //   80e103               | push                edi
            //   8aec                 | push                2
            //   c0ed03               | lea                 ecx, [ebp - 0x18]

        $sequence_2 = { ac 8bda c1e305 03c3 }
            // n = 4, score = 700
            //   ac                   | lcall               0x1536:0xed56af10
            //   8bda                 | cmp                 esi, dword ptr [ebx]
            //   c1e305               | pop                 edx
            //   03c3                 | pop                 ss

        $sequence_3 = { 8bda c1e305 03c3 8bda }
            // n = 4, score = 700
            //   8bda                 | mov                 edx, dword ptr [ebp + 0xc]
            //   c1e305               | mov                 dword ptr [edx + 0x514], eax
            //   03c3                 | cmp                 eax, ebx
            //   8bda                 | jne                 0xfffe613c

        $sequence_4 = { 8acc 80e103 8aec c0ed03 80e507 }
            // n = 5, score = 700
            //   8acc                 | cmp                 dword ptr [ebp - 8], 8
            //   80e103               | test                al, al
            //   8aec                 | jne                 0xf8be
            //   c0ed03               | and                 ecx, 0xf0
            //   80e507               | cmp                 cl, 0xe0

        $sequence_5 = { c1e305 03c3 8bda c1eb02 03c3 }
            // n = 5, score = 700
            //   c1e305               | je                  0xffff21f7
            //   03c3                 | mov                 dword ptr [esi + 8], 0x110
            //   8bda                 | mov                 dword ptr [esi], 0
            //   c1eb02               | mov                 esi, eax
            //   03c3                 | test                esi, esi

        $sequence_6 = { 80f457 8acc 80e103 8aec }
            // n = 4, score = 700
            //   80f457               | push                ss
            //   8acc                 | aas                 
            //   80e103               | imul                dword ptr [ecx - 0x7d]
            //   8aec                 | push                edi

        $sequence_7 = { c1e305 03c3 8bda c1eb02 03c3 33d0 }
            // n = 6, score = 700
            //   c1e305               | push                eax
            //   03c3                 | call                edi
            //   8bda                 | mov                 eax, dword ptr [esi + 0x28c]
            //   c1eb02               | mov                 eax, dword ptr [esi + 0x28c]
            //   03c3                 | test                eax, eax
            //   33d0                 | je                  0xfffffe8e

        $sequence_8 = { ac 8bda c1e305 03c3 8bda c1eb02 03c3 }
            // n = 7, score = 700
            //   ac                   | mov                 dl, byte ptr [edi + eax + 1]
            //   8bda                 | inc                 eax
            //   c1e305               | cmp                 dl, byte ptr [eax]
            //   03c3                 | mov                 dl, byte ptr [edi + eax]
            //   8bda                 | mov                 dword ptr [ebp - 0x1c], edi
            //   c1eb02               | cmp                 dl, byte ptr [eax]
            //   03c3                 | jne                 0x11478

        $sequence_9 = { c1e305 03c3 8bda c1eb02 }
            // n = 4, score = 700
            //   c1e305               | cmp                 ecx, eax
            //   03c3                 | jb                  0x99c5
            //   8bda                 | adc                 ecx, esi
            //   c1eb02               | cmp                 ecx, eax

    condition:
        7 of them and filesize < 1106944
}