Return-Path: <linux-fbdev+bounces-5021-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DFBB8C400
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Sep 2025 10:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 392D17C75B8
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Sep 2025 08:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A688F28642A;
	Sat, 20 Sep 2025 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBjQ1R9+"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93232836A0
	for <linux-fbdev@vger.kernel.org>; Sat, 20 Sep 2025 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758357457; cv=none; b=DBnhdoTtqmDsyoYIbYtUoAqHLfZBjfBFEKJs+aqoYBhY2JyHyyXPYE/0v1SX8+VzPCW1thcNVBSQ0XUKnswU1W4GbRcKhbWQyutCXcIE405I3S45/ntgfvGRP/sY5dibOU6ZYK8gZNvWbQUBBNJoanaTExp/5s81QA3+dw6NxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758357457; c=relaxed/simple;
	bh=LlzRi6bk10r8Z/aQ0b6CxVImRK79Ze9lOeWEQTrLmNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVZUGkZ2UwpvgOptsXjYEy/yA3qZets2jwGK7YZddlRl5w2wY5FdINFtolQxkCnmKo8qFa+o9Xfxx5zZFqh7I7twKwPMdq+kmIl0gXZUUaWxG4238D/f5oBOJE8qTeXyboeBH3lG9pYwSG1bev288vMCvY7q8aJGkMz+ZnqIP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBjQ1R9+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758357456; x=1789893456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LlzRi6bk10r8Z/aQ0b6CxVImRK79Ze9lOeWEQTrLmNI=;
  b=fBjQ1R9+xXwGDSgKI3o7YRZXkUb8daO23gYX/AbtT4rnZVTpFWP47R4G
   oTdHlsqMUozE7NPIEU4ykSD6uB/RWyHREd+3a4tRNqSQEyCf0j7h57APi
   r+9Ol9UUxEXbOZnPnmq967TCvhGcQTgeaN5WvGEK6wl+WZhfOaddhuq6C
   6+GbHAsrdGrOQ0O8oSagVQPXvkqViX2/TCBIz/zsjfNr6sXlT6oKyndw1
   lfQ5l+LzKhgR8MpqewfzcY1chrN9RAOWd5rypGEbW1pSyIgfNY5mjfls8
   /sHGkVApN+hWfDNec/20OYrT4dBQcs82kod9jcx0Qcz4HSLzcAMZDQck2
   Q==;
X-CSE-ConnectionGUID: pvcb3IMeTOWhmbN5D6zvCA==
X-CSE-MsgGUID: 9zaourSYSIeQ3ETAU5EqUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64512819"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="64512819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 01:37:35 -0700
X-CSE-ConnectionGUID: Dfw/SjHRRkqqAwhq4X36bA==
X-CSE-MsgGUID: 9VeOsDXBTFy6vTS6xHtZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="199748111"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2025 01:37:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzt63-0005B1-0s;
	Sat, 20 Sep 2025 08:37:31 +0000
Date: Sat, 20 Sep 2025 16:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: DeepanshuPratik <deepanshu.pratik@gmail.com>, andy@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	DeepanshuPratik <deepanshu.pratik@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix macro usage and style warnings
Message-ID: <202509201601.hTKUjeIe-lkp@intel.com>
References: <20250919212938.822374-1-deepanshu.pratik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919212938.822374-1-deepanshu.pratik@gmail.com>

Hi DeepanshuPratik,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/DeepanshuPratik/staging-fbtft-fix-macro-usage-and-style-warnings/20250920-053248
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250919212938.822374-1-deepanshu.pratik%40gmail.com
patch subject: [PATCH] staging: fbtft: fix macro usage and style warnings
config: x86_64-buildonly-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201601.hTKUjeIe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201601.hTKUjeIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201601.hTKUjeIe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:15:2: error: '#' is not followed by a macro parameter
      15 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |  ^
>> drivers/staging/fbtft/fbtft-bus.c:66:47: error: unexpected type name 'u8': expected identifier
      66 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
         |                                               ^
   drivers/staging/fbtft/fbtft-bus.c:66:51: error: unexpected type name 'u8': expected identifier
      66 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
         |                                                   ^
>> drivers/staging/fbtft/fbtft-bus.c:66:51: error: redefinition of parameter 'u8'
>> drivers/staging/fbtft/fbtft-bus.c:67:1: error: expected function body after function declarator
      67 | define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
         | ^
   5 errors generated.


vim +15 drivers/staging/fbtft/fbtft-bus.c

c296d5f9957c039 Thomas Petazzoni   2014-12-31   7  
c296d5f9957c039 Thomas Petazzoni   2014-12-31   8  /*****************************************************************************
c296d5f9957c039 Thomas Petazzoni   2014-12-31   9   *
c296d5f9957c039 Thomas Petazzoni   2014-12-31  10   *   void (*write_reg)(struct fbtft_par *par, int len, ...);
c296d5f9957c039 Thomas Petazzoni   2014-12-31  11   *
c296d5f9957c039 Thomas Petazzoni   2014-12-31  12   *****************************************************************************/
c296d5f9957c039 Thomas Petazzoni   2014-12-31  13  
49f31092c55579e DeepanshuPratik    2025-09-20  14  #define NOOP(x) (x)                                                           \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17 @15  #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  16  void func(struct fbtft_par *par, int len, ...)                                \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  17  {                                                                             \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  18  	va_list args;                                                         \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  19  	int i, ret;                                                           \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  20  	int offset = 0;                                                       \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  21  	buffer_type *buf = (buffer_type *)par->buf;                           \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  22  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  23  	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {                    \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  24  		va_start(args, len);                                          \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  25  		for (i = 0; i < len; i++) {                                   \
cc1c0eea8527bd2 Renato Soma        2018-04-17  26  			buf[i] = modifier((data_type)va_arg(args,             \
cc1c0eea8527bd2 Renato Soma        2018-04-17  27  							    unsigned int));   \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  28  		}                                                             \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  29  		va_end(args);                                                 \
cc1c0eea8527bd2 Renato Soma        2018-04-17  30  		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,                  \
cc1c0eea8527bd2 Renato Soma        2018-04-17  31  				  par->info->device, buffer_type, buf, len,   \
cc1c0eea8527bd2 Renato Soma        2018-04-17  32  				  "%s: ", __func__);                          \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  33  	}                                                                     \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  34  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  35  	va_start(args, len);                                                  \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  36  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  37  	if (par->startbyte) {                                                 \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  38  		*(u8 *)par->buf = par->startbyte;                             \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  39  		buf = (buffer_type *)(par->buf + 1);                          \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  40  		offset = 1;                                                   \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  41  	}                                                                     \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  42  									      \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  43  	*buf = modifier((data_type)va_arg(args, unsigned int));               \
cc1c0eea8527bd2 Renato Soma        2018-04-17  44  	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
cc1c0eea8527bd2 Renato Soma        2018-04-17  45  				 0);                                          \
e70065fdc11d86f Heiner Kallweit    2017-03-02  46  	if (ret < 0)							      \
e70065fdc11d86f Heiner Kallweit    2017-03-02  47  		goto out;						      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  48  	len--;                                                                \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  49  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  50  	if (par->startbyte)                                                   \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  51  		*(u8 *)par->buf = par->startbyte | 0x2;                       \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  52  									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  53  	if (len) {                                                            \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  54  		i = len;                                                      \
e70065fdc11d86f Heiner Kallweit    2017-03-02  55  		while (i--)						      \
cc1c0eea8527bd2 Renato Soma        2018-04-17  56  			*buf++ = modifier((data_type)va_arg(args,             \
cc1c0eea8527bd2 Renato Soma        2018-04-17  57  							    unsigned int));   \
e70065fdc11d86f Heiner Kallweit    2017-03-02  58  		fbtft_write_buf_dc(par, par->buf,			      \
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17  59  				   len * (sizeof(data_type) + offset), 1);    \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  60  	}                                                                     \
e70065fdc11d86f Heiner Kallweit    2017-03-02  61  out:									      \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  62  	va_end(args);                                                         \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  63  }                                                                             \
c296d5f9957c039 Thomas Petazzoni   2014-12-31  64  EXPORT_SYMBOL(func);
c296d5f9957c039 Thomas Petazzoni   2014-12-31  65  
49f31092c55579e DeepanshuPratik    2025-09-20 @66  define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, NOOP)
8d8825b420ffb37 Alfonso Lima Astor 2017-10-17 @67  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
49f31092c55579e DeepanshuPratik    2025-09-20  68  define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, NOOP)
c296d5f9957c039 Thomas Petazzoni   2014-12-31  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

