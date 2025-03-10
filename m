Return-Path: <linux-fbdev+bounces-4034-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17CA58A69
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Mar 2025 03:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857DD3A96B7
	for <lists+linux-fbdev@lfdr.de>; Mon, 10 Mar 2025 02:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72809170A11;
	Mon, 10 Mar 2025 02:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHKuv12A"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E1189906
	for <linux-fbdev@vger.kernel.org>; Mon, 10 Mar 2025 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741573406; cv=none; b=E4DrnKHDESjGDnFMBb+RpvLc+VrcYBZ4K0Ds0VYa8Qxx4ecq0iW64TDue4IcBtONh8AIpg/jUZlV5lmpEfCq14uiH4MRi1mt5smmZde1Eg6u6mbe8PtWt74jCivz4O+AlUEXOTVOuYt3bNvEj7VhxZzK+xqoBOHqCj/Mss4IzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741573406; c=relaxed/simple;
	bh=3gVBwQ+xnSHDQdwleaOPzbEA18eMDGqNSgUHEhn4lSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAZEI6lsGG7Fnjkf24KkEUSVTRHJbjCdG/GXA6h8nngMn+phdkXZfTnro2AcbNpf5HMfK/0tbRTECBd+cXdFQtjZAyjSrhfPzomAJdjqOiiPPEpA9Vfk00gvxjzxCKY42Ee82V+EgFHdqI3xxbLEIP7b0g8Nw/XWflKUt48aX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHKuv12A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741573403; x=1773109403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3gVBwQ+xnSHDQdwleaOPzbEA18eMDGqNSgUHEhn4lSc=;
  b=BHKuv12AYtVhfq3gyr/ABHpACYY1xauVf31zFu2lCLm5UDGCcmwyGHF6
   LbyPFjUZwIWXFEoUfYbX5pVIS03TOS0OcqVigfEbRu+7TBuNLOVfymMRo
   fikmdde5qunNI7SJrJ/xQQ4rG88eloRyR984D1v3hTVGK8dtlf/jRH+KO
   EeZddTtUWmzX/YKwRwyuYlLay1OiR2ERLHWllGRQ2wjoGVI7vVMELbkaS
   Gucw4K5glsteFyhV8lHX33TJWiGkcmKJkYXX6jeuMW7xg+9fiTOffwWbq
   j4kfvH4DGwG7gbTtUrLOTKf4CrLdZQSF6CNjnWim57/onCFOD5YL9tBUX
   w==;
X-CSE-ConnectionGUID: ndXseANWT122pnmjIv6Pfg==
X-CSE-MsgGUID: X+KaPu6cT2SXh2aveCXStw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42747183"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42747183"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:23:22 -0700
X-CSE-ConnectionGUID: xtzFaLkpR+OWljWM7Nyuyw==
X-CSE-MsgGUID: PEjtvO1ZSQK/meadhrz2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119809225"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2025 19:23:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trSnV-0003iO-2l;
	Mon, 10 Mar 2025 02:23:17 +0000
Date: Mon, 10 Mar 2025 10:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Zsolt Kajtar <soci@c64.rulez.org>
Subject: Re: [PATCH RESEND 1/2] Refactoring the fbcon packed pixel drawing
 routines
Message-ID: <202503101013.VkX1hbJx-lkp@intel.com>
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
[also build test ERROR on v6.14-rc6 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zsolt-Kajtar/Refactoring-the-fbcon-packed-pixel-drawing-routines/20250310-025619
base:   linus/master
patch link:    https://lore.kernel.org/r/20250309184716.13732-2-soci%40c64.rulez.org
patch subject: [PATCH RESEND 1/2] Refactoring the fbcon packed pixel drawing routines
config: arm-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101013.VkX1hbJx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101013.VkX1hbJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101013.VkX1hbJx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/wmt_ge_rops.c:15:
>> drivers/video/fbdev/core/fb_draw.h:16:48: warning: 'struct fb_address' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline void fb_address_move_long(struct fb_address *adr, int offset)
         |                                                ^~~~~~~~~~
   drivers/video/fbdev/core/fb_draw.h: In function 'fb_address_move_long':
>> drivers/video/fbdev/core/fb_draw.h:18:12: error: invalid use of undefined type 'struct fb_address'
      18 |         adr->address += offset * (BITS_PER_LONG / BITS_PER_BYTE);
         |            ^~
   drivers/video/fbdev/core/fb_draw.h: At top level:
   drivers/video/fbdev/core/fb_draw.h:22:46: warning: 'struct fb_address' declared inside parameter list will not be visible outside of this definition or declaration
      22 | static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
         |                                              ^~~~~~~~~~
   drivers/video/fbdev/core/fb_draw.h: In function 'fb_address_forward':
   drivers/video/fbdev/core/fb_draw.h:24:46: error: invalid use of undefined type 'struct fb_address'
      24 |         unsigned int bits = (unsigned int)adr->bits + offset;
         |                                              ^~
   drivers/video/fbdev/core/fb_draw.h:26:12: error: invalid use of undefined type 'struct fb_address'
      26 |         adr->bits = bits & (BITS_PER_LONG - 1u);
         |            ^~
   drivers/video/fbdev/core/fb_draw.h:27:12: error: invalid use of undefined type 'struct fb_address'
      27 |         adr->address += (bits & ~(BITS_PER_LONG - 1u)) / BITS_PER_BYTE;
         |            ^~
   drivers/video/fbdev/core/fb_draw.h: At top level:
   drivers/video/fbdev/core/fb_draw.h:31:47: warning: 'struct fb_address' declared inside parameter list will not be visible outside of this definition or declaration
      31 | static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
         |                                               ^~~~~~~~~~
   drivers/video/fbdev/core/fb_draw.h: In function 'fb_address_backward':
   drivers/video/fbdev/core/fb_draw.h:33:23: error: invalid use of undefined type 'struct fb_address'
      33 |         int bits = adr->bits - (int)offset;
         |                       ^~
   drivers/video/fbdev/core/fb_draw.h:35:12: error: invalid use of undefined type 'struct fb_address'
      35 |         adr->bits = bits & (BITS_PER_LONG - 1);
         |            ^~
   drivers/video/fbdev/core/fb_draw.h:37:20: error: invalid use of undefined type 'struct fb_address'
      37 |                 adr->address -= (adr->bits - bits) / BITS_PER_BYTE;
         |                    ^~
   drivers/video/fbdev/core/fb_draw.h:37:37: error: invalid use of undefined type 'struct fb_address'
      37 |                 adr->address -= (adr->bits - bits) / BITS_PER_BYTE;
         |                                     ^~
   drivers/video/fbdev/core/fb_draw.h:39:20: error: invalid use of undefined type 'struct fb_address'
      39 |                 adr->address += (bits - adr->bits) / BITS_PER_BYTE;
         |                    ^~
   drivers/video/fbdev/core/fb_draw.h:39:44: error: invalid use of undefined type 'struct fb_address'
      39 |                 adr->address += (bits - adr->bits) / BITS_PER_BYTE;
         |                                            ^~
   drivers/video/fbdev/core/fb_draw.h: At top level:
   drivers/video/fbdev/core/fb_draw.h:50:62: warning: 'struct fb_address' declared inside parameter list will not be visible outside of this definition or declaration
      50 |                                     int offset, const struct fb_address *dst)
         |                                                              ^~~~~~~~~~
   drivers/video/fbdev/core/fb_draw.h: In function 'fb_modify_offset':
>> drivers/video/fbdev/core/fb_draw.h:52:9: error: implicit declaration of function 'fb_write_offset'; did you mean 'fb_modify_offset'? [-Wimplicit-function-declaration]
      52 |         fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
         |         ^~~~~~~~~~~~~~~
         |         fb_modify_offset
>> drivers/video/fbdev/core/fb_draw.h:52:38: error: implicit declaration of function 'fb_read_offset'; did you mean 'fb_modify_offset'? [-Wimplicit-function-declaration]
      52 |         fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
         |                                      ^~~~~~~~~~~~~~
         |                                      fb_modify_offset
   drivers/video/fbdev/core/fb_draw.h: In function 'fb_reverse_bits_long':
>> drivers/video/fbdev/core/fb_draw.h:106:16: error: implicit declaration of function 'bitrev8x4' [-Wimplicit-function-declaration]
     106 |         return bitrev8x4(val);
         |                ^~~~~~~~~
   drivers/video/fbdev/wmt_ge_rops.c: In function 'wmt_ge_fillrect':
>> drivers/video/fbdev/wmt_ge_rops.c:57:15: error: implicit declaration of function 'pixel_to_pat' [-Wimplicit-function-declaration]
      57 |         pat = pixel_to_pat(p->var.bits_per_pixel, fg);
         |               ^~~~~~~~~~~~


vim +18 drivers/video/fbdev/core/fb_draw.h

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
    55	/*
    56	 * get current palette, if applicable for visual
    57	 *
    58	 * The pseudo color table entries (and colors) are right justified and in the
    59	 * same byte order as it's expected to be placed into a native ordered
    60	 * framebuffer memory. What that means:
    61	 *
    62	 * Expected bytes in framebuffer memory (in native order):
    63	 * RR GG BB RR GG BB RR GG BB ...
    64	 *
    65	 * Pseudo palette entry on little endian arch:
    66	 * RR | GG << 8 | BB << 16
    67	 *
    68	 * Pseudo palette entry on a big endian arch:
    69	 * RR << 16 | GG << 8 | BB
    70	 */
    71	static inline const u32 *fb_palette(struct fb_info *info)
    72	{
    73		return (info->fix.visual == FB_VISUAL_TRUECOLOR ||
    74			info->fix.visual == FB_VISUAL_DIRECTCOLOR) ? info->pseudo_palette : NULL;
    75	}
    76	
    77	/* move pixels right on screen when framebuffer is in native order */
    78	static inline unsigned long fb_right(unsigned long value, int index)
    79	{
    80	#ifdef __LITTLE_ENDIAN
    81		return value << index;
    82	#else
    83		return value >> index;
    84	#endif
    85	}
    86	
    87	/* move pixels left on screen when framebuffer is in native order */
    88	static inline unsigned long fb_left(unsigned long value, int index)
    89	{
    90	#ifdef __LITTLE_ENDIAN
    91		return value >> index;
    92	#else
    93		return value << index;
    94	#endif
    95	}
    96	
    97	/* reversal options */
    98	struct fb_reverse {
    99		bool byte, pixel;
   100	};
   101	
   102	/* reverse bits of each byte in a long */
   103	static inline unsigned long fb_reverse_bits_long(unsigned long val)
   104	{
   105	#if defined(CONFIG_HAVE_ARCH_BITREVERSE) && BITS_PER_LONG == 32
 > 106		return bitrev8x4(val);
   107	#else
   108		val = fb_comp(val >> 1, val << 1, ~0UL / 3);
   109		val = fb_comp(val >> 2, val << 2, ~0UL / 5);
   110		return fb_comp(val >> 4, val << 4, ~0UL / 17);
   111	#endif
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

