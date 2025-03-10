Return-Path: <linux-fbdev+bounces-4032-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7321A589D6
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Mar 2025 02:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E683188ACD6
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Mar 2025 01:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4618E288D6;
	Mon, 10 Mar 2025 01:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGP8AqOE"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76691401B
	for <linux-fbdev@vger.kernel.org>; Mon, 10 Mar 2025 01:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741568450; cv=none; b=PmaWw7zasu8ZVV/jGgw9lKqEhFgh+lDb757M0/hSuqxbyGBXSZ/S5dKolCOsGdmvlVSNpdVwqONFpEpyyEMmHA/slHF+tj9M0+Vr+iZntcWN0fVGSqQbzmfOiLJcSHwNrj8Tux3DtXcpmGcnfR1TGY3KlbwCXgNl45t/w526SqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741568450; c=relaxed/simple;
	bh=ATKBXs54xojdbxT24WNkcELorESgyhG6mFkqqtotNFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzGFrwmAP/VMGcGsN33TyI6trahRryDyQLIbMVUUCAmGtCslJN5ZHZiz87xKboBuwNsFDS+3DCGWSh+0RtfOIsCydlxMc38xvMB5cofUvJ/Y0+wRDFbZLC0h92R3nd7ZAKD+0UhyGSskLhCfl6m6LVhevqKVuqKqSwhKAhw4uSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGP8AqOE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741568448; x=1773104448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATKBXs54xojdbxT24WNkcELorESgyhG6mFkqqtotNFY=;
  b=TGP8AqOEMojtVvAXZwA4mzl4I3aMVLc2o92KWg3FpluZikdg02zlu8Sk
   V2K8/bWD/L8i5RSTwORLOkr1zep7P2xOZKC/aXEvGv/KFEFTgv/q74qst
   1gz1mJkG5s18Z36I0BpbFZdSj9V/Yjjr0RRGg6y/zViZKidhWoTiHlmEM
   IREwCHR4qbCRuqzklL5OVftk4jMfeajhXAK+262nyAw5PAYvwT2DaVWBz
   wUuJ6hLc6dw12QxXSfC92Hye063yi6pW4h+4/UnTR5GqL8odfIEZ5vxHS
   Sh+/DcMDayYJ2Wp7gsR1fklS+0SjAncshQiVNGHPSy4W0QB/jEPCOCKGg
   Q==;
X-CSE-ConnectionGUID: xfcWwxdrSiOy8SGNSuqmAg==
X-CSE-MsgGUID: 6ieC1ZLzScaQnrQvhH3NQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="59959528"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="59959528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 18:00:47 -0700
X-CSE-ConnectionGUID: BmLNX371QpaiMXDxa8/IHw==
X-CSE-MsgGUID: dGmMCrapQkaSnmaU2L1/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="143065153"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Mar 2025 18:00:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trRVb-0003fg-0B;
	Mon, 10 Mar 2025 01:00:43 +0000
Date: Mon, 10 Mar 2025 09:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Zsolt Kajtar <soci@c64.rulez.org>
Subject: Re: [PATCH RESEND 1/2] Refactoring the fbcon packed pixel drawing
 routines
Message-ID: <202503100810.9iId3430-lkp@intel.com>
References: <20250309184716.13732-2-soci@c64.rulez.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309184716.13732-2-soci@c64.rulez.org>

Hi Zsolt,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zsolt-Kajtar/Refactoring-the-fbcon-packed-pixel-drawing-routines/20250310-025619
base:   linus/master
patch link:    https://lore.kernel.org/r/20250309184716.13732-2-soci%40c64.rulez.org
patch subject: [PATCH RESEND 1/2] Refactoring the fbcon packed pixel drawing routines
config: i386-buildonly-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100810.9iId3430-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100810.9iId3430-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100810.9iId3430-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/aty/mach64_cursor.c:9:
>> drivers/video/fbdev/aty/../core/fb_draw.h:16:48: warning: declaration of 'struct fb_address' will not be visible outside of this function [-Wvisibility]
      16 | static inline void fb_address_move_long(struct fb_address *adr, int offset)
         |                                                ^
>> drivers/video/fbdev/aty/../core/fb_draw.h:18:5: error: incomplete definition of type 'struct fb_address'
      18 |         adr->address += offset * (BITS_PER_LONG / BITS_PER_BYTE);
         |         ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:16:48: note: forward declaration of 'struct fb_address'
      16 | static inline void fb_address_move_long(struct fb_address *adr, int offset)
         |                                                ^
   drivers/video/fbdev/aty/../core/fb_draw.h:22:46: warning: declaration of 'struct fb_address' will not be visible outside of this function [-Wvisibility]
      22 | static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
         |                                              ^
   drivers/video/fbdev/aty/../core/fb_draw.h:24:39: error: incomplete definition of type 'struct fb_address'
      24 |         unsigned int bits = (unsigned int)adr->bits + offset;
         |                                           ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:22:46: note: forward declaration of 'struct fb_address'
      22 | static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
         |                                              ^
   drivers/video/fbdev/aty/../core/fb_draw.h:26:5: error: incomplete definition of type 'struct fb_address'
      26 |         adr->bits = bits & (BITS_PER_LONG - 1u);
         |         ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:22:46: note: forward declaration of 'struct fb_address'
      22 | static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
         |                                              ^
   drivers/video/fbdev/aty/../core/fb_draw.h:27:5: error: incomplete definition of type 'struct fb_address'
      27 |         adr->address += (bits & ~(BITS_PER_LONG - 1u)) / BITS_PER_BYTE;
         |         ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:22:46: note: forward declaration of 'struct fb_address'
      22 | static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
         |                                              ^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: warning: declaration of 'struct fb_address' will not be visible outside of this function [-Wvisibility]
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:33:16: error: incomplete definition of type 'struct fb_address'
      33 |         int bits = adr->bits - (int)offset;
         |                    ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: note: forward declaration of 'struct fb_address'
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:35:5: error: incomplete definition of type 'struct fb_address'
      35 |         adr->bits = bits & (BITS_PER_LONG - 1);
         |         ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: note: forward declaration of 'struct fb_address'
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:37:6: error: incomplete definition of type 'struct fb_address'
      37 |                 adr->address -= (adr->bits - bits) / BITS_PER_BYTE;
         |                 ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: note: forward declaration of 'struct fb_address'
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:37:23: error: incomplete definition of type 'struct fb_address'
      37 |                 adr->address -= (adr->bits - bits) / BITS_PER_BYTE;
         |                                  ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: note: forward declaration of 'struct fb_address'
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:39:6: error: incomplete definition of type 'struct fb_address'
      39 |                 adr->address += (bits - adr->bits) / BITS_PER_BYTE;
         |                 ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: note: forward declaration of 'struct fb_address'
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:39:30: error: incomplete definition of type 'struct fb_address'
      39 |                 adr->address += (bits - adr->bits) / BITS_PER_BYTE;
         |                                         ~~~^
   drivers/video/fbdev/aty/../core/fb_draw.h:31:47: note: forward declaration of 'struct fb_address'
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^
   drivers/video/fbdev/aty/../core/fb_draw.h:50:34: warning: declaration of 'struct fb_address' will not be visible outside of this function [-Wvisibility]
      50 |                                     int offset, const struct fb_address *dst)
         |                                                              ^
>> drivers/video/fbdev/aty/../core/fb_draw.h:52:2: error: call to undeclared function 'fb_write_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      52 |         fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
         |         ^
   drivers/video/fbdev/aty/../core/fb_draw.h:52:2: note: did you mean 'fb_modify_offset'?
   drivers/video/fbdev/aty/../core/fb_draw.h:49:20: note: 'fb_modify_offset' declared here
      49 | static inline void fb_modify_offset(unsigned long val, unsigned long mask,
         |                    ^
      50 |                                     int offset, const struct fb_address *dst)
      51 | {
      52 |         fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
         |         ~~~~~~~~~~~~~~~
         |         fb_modify_offset
>> drivers/video/fbdev/aty/../core/fb_draw.h:52:31: error: call to undeclared function 'fb_read_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      52 |         fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
         |                                      ^
>> drivers/video/fbdev/aty/mach64_cursor.c:184:9: error: call to undeclared function 'comp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |                                 l = comp(l, 0xaaaa,
         |                                     ^
   4 warnings and 13 errors generated.


vim +18 drivers/video/fbdev/aty/../core/fb_draw.h

    14	
    15	/* move the address pointer by the number of words */
  > 16	static inline void fb_address_move_long(struct fb_address *adr, int offset)
    17	{
  > 18		adr->address += offset * (BITS_PER_LONG / BITS_PER_BYTE);
    19	}
    20	
    21	/* move the address pointer forward with the number of bits */
    22	static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
    23	{
    24		unsigned int bits = (unsigned int)adr->bits + offset;
    25	
    26		adr->bits = bits & (BITS_PER_LONG - 1u);
    27		adr->address += (bits & ~(BITS_PER_LONG - 1u)) / BITS_PER_BYTE;
    28	}
    29	
    30	/* move the address pointer backwards with the number of bits */
    31	static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
    32	{
    33		int bits = adr->bits - (int)offset;
    34	
    35		adr->bits = bits & (BITS_PER_LONG - 1);
    36		if (bits < 0)
    37			adr->address -= (adr->bits - bits) / BITS_PER_BYTE;
    38		else
    39			adr->address += (bits - adr->bits) / BITS_PER_BYTE;
    40	}
    41	
    42	/* compose pixels based on mask */
    43	static inline unsigned long fb_comp(unsigned long set, unsigned long unset, unsigned long mask)
    44	{
    45		return ((set ^ unset) & mask) ^ unset;
    46	}
    47	
    48	/* framebuffer read-modify-write access for replacing bits in the mask */
    49	static inline void fb_modify_offset(unsigned long val, unsigned long mask,
    50					    int offset, const struct fb_address *dst)
    51	{
  > 52		fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

