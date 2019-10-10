Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D04D1FC0
	for <lists+linux-fbdev@lfdr.de>; Thu, 10 Oct 2019 06:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfJJEob (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 10 Oct 2019 00:44:31 -0400
Received: from mx2.ucr.edu ([138.23.62.3]:4675 "EHLO mx2.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbfJJEob (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 10 Oct 2019 00:44:31 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Oct 2019 00:44:30 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570682670; x=1602218670;
  h=from:to:cc:subject:date:message-id;
  bh=Qglj1z/rVFrSvjj0s8+qncgzWBHeOEvd87vRgzQFxfQ=;
  b=GnllRdci589bKzJkps8n19oX4WWaxeEPKZMAh8uufzGt0kiMEkKXDeSf
   Gnqa/ac1bfNiD3m9Pp+fnsygVTQnKuZCFlv6iw++VsD2ipK8+LuCwMtNq
   NFdYEGnGDWxmrTwykZ34ungcCtkDEHGHe2h8r1DSn0nIUBmyfJ7GV6Z6K
   wodcV4bFQnbwEF+PIefAU9fp8NSSwva5j9tOtjQMueRiZwfXfKfAqy8np
   5dvIoxX43PxONKHyyre0oV1a+eOWuclSaO8Ly5bha+1pwptG5t8Wc6Mun
   sRWdcP+ZSTHu1KI1JrwqQMNmjw4LxeFu0+g4T2sOrUdeV8dsUABMjr4Tv
   Q==;
IronPort-SDR: CvbhAieOZcVEFX/zjIvBfJaEf68XbIgiFRi8DgYt0cgEggW4lvQOtZA3WUIxDIAgM3yHqhzejJ
 P64UABvYF7fHUat17Ejf7Rsa5SsHsBfxQ0jVWnpS5U8j8r2UrxBB7JgjODF8kD6QQKSkI094Cv
 fDbSSW0YIDFhhPNBDUGx1J6ABa7e9tYE+p94BTCIr2YzAAOVbUVd8JVZpaQzKQcUV1tH1QKvNS
 7KEI6GlajCDuJVdNNiof2Tsd0X5hw24F/5sE+AE4Ccf/O6YfhI/LyJbxnvaS4Z+YdetjoNTioi
 UjY=
IronPort-PHdr: =?us-ascii?q?9a23=3A/k98IReEVoHPdbR0EjZQcRHGlGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcS7Yx7h7PlgxGXEQZ/co6odzbaP6Oa+AydQv96oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIhi6twTcutcZjYZhK6s61w?=
 =?us-ascii?q?fErGZPd+lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2?=
 =?us-ascii?q?466svrtQLeTQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUj?=
 =?us-ascii?q?ms86tnVBnlgzocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSX?=
 =?us-ascii?q?ZEUstXUixBA5i8b5AOD+oHMuZTspfzqUITphuwBAmjGufvxSJVjXPy06A2z+?=
 =?us-ascii?q?EtHAfB0wE8Ed8CrGnYoMzpOKsPTOu5yLTEwDXGY/5QxDzz6pXHcgo5rP+MQ7?=
 =?us-ascii?q?x+bMTfx0ooGQ7eklmctZboMy+P2+gRr2SW6fdrW+K1i24grgF8ujqgxsYti4?=
 =?us-ascii?q?nJm4IVzU3P+CJ5wYc0Jd23Uk97bcK4HJZerCyaKpd5Qtk4T252pSk616QLtJ?=
 =?us-ascii?q?imdyYJ0JQq3wDTZ+CDfoSS4R/uVPydLSlliH55Yr6zmhK//Ey4xuHhV8S51E?=
 =?us-ascii?q?xGojRLn9TMrHwByR3e5tKFR/Zy+EqqxCyB2BrJ6u5eJEA5ja/bK5k8zbEujp?=
 =?us-ascii?q?cTqkHDHjPumEXxka+Wal0o+ui25OTjZbXrvpqcOJV1igH6K6gugsK/DfkhPg?=
 =?us-ascii?q?gAQmSW/eCx2Kfs/U3+R7VKgfk2nbfDvJ/GIsQbo7a1Aw5T0ok99xayFymq3M?=
 =?us-ascii?q?gckHUdL19IeAiLg5b0N13SOvz0EPOyjlC0nDdu3f/GP7nhApvXLnjElbfsZb?=
 =?us-ascii?q?Z86k9cyAUpzNBT+45YB78aLfLuRkDxrsbUAQEkPAyp2+rnEsly1psCWWKTBa?=
 =?us-ascii?q?+UKKfSsV6O5uIyLOiAfYEVty3gJPc7+f7jlmE5mVADcqmzx5cXa263Hu5gI0?=
 =?us-ascii?q?qHZXrgmNABEX0Fvll2YvbtjQizUCxTenH6C7Mu5jg6UNr9JZrIXMagjKHXj3?=
 =?us-ascii?q?TzJYFfem0TUgPEKnzvbYjRHqpRZQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HSCgCwtJ5dh8fSVdFlHgELHIFwC4N?=
 =?us-ascii?q?fTBCNJYYqAQEGiykYcYV6ijABCAEBAQwBAS0CAQGEQIJUIzcGDgIDCQEBBQE?=
 =?us-ascii?q?BAQEBBQQBAQIQAQEBCA0JCCmFQII6KYM1CxZngRUBBQE1IjmCRwGCUiWkQ4E?=
 =?us-ascii?q?DPIxYiGYBCQ2BSAkBCIEihzWEWYEQgQeEYYQNg1mCSgSBOQEBAZUvllcBBgK?=
 =?us-ascii?q?CEBSBeJMVJ4Q8iT+LRAGnYwIKBwYPI4FFgXxNJYFsCoFEUBAUgVsOCY5DITO?=
 =?us-ascii?q?BCI0/glQB?=
X-IPAS-Result: =?us-ascii?q?A2HSCgCwtJ5dh8fSVdFlHgELHIFwC4NfTBCNJYYqAQEGi?=
 =?us-ascii?q?ykYcYV6ijABCAEBAQwBAS0CAQGEQIJUIzcGDgIDCQEBBQEBAQEBBQQBAQIQA?=
 =?us-ascii?q?QEBCA0JCCmFQII6KYM1CxZngRUBBQE1IjmCRwGCUiWkQ4EDPIxYiGYBCQ2BS?=
 =?us-ascii?q?AkBCIEihzWEWYEQgQeEYYQNg1mCSgSBOQEBAZUvllcBBgKCEBSBeJMVJ4Q8i?=
 =?us-ascii?q?T+LRAGnYwIKBwYPI4FFgXxNJYFsCoFEUBAUgVsOCY5DITOBCI0/glQB?=
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; 
   d="scan'208";a="14124587"
Received: from mail-pf1-f199.google.com ([209.85.210.199])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2019 21:37:24 -0700
Received: by mail-pf1-f199.google.com with SMTP id s139so3747330pfc.21
        for <linux-fbdev@vger.kernel.org>; Wed, 09 Oct 2019 21:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Z2jlPo7cNUsYiJLA96HLY+XLNur36/5ee7Rqvg0uC5E=;
        b=JHX4v9cyaf2KdstLqvZ+1vcpji2cPdlsGQ4zsGyUYZ+YakY8O9aVp5Fwup/eolCu2d
         f/X3gKPe5UOXJiKhQHs3gN6GMb2+3AF4FeI3Supb2ffhhJZ3yP3YMCZqW4zdshID0UB7
         8a19LudJUCV7bxLUvVv/d9GWzsB5aKq27GMAJkg0vfkWUG7KAO279wl0o2FMi3fTQJUU
         WeV8LY9tzecl6ru/GUAZ4ISWAeFJkQtAuKwm/1A7qs2kJRJk13yEZOPfvf36Ina5HmHS
         35l5y9Fb733KtV6VNkGj3RPERWc2EDwgbqU0SZYLGtPXG+aZgsC3kqLsq2I0AECXkIQQ
         ppwg==
X-Gm-Message-State: APjAAAUp0uMugyvLgDpC7jzum7Yh6KwhWgbfYfRCmNkeaMYr+sbO0mU2
        xr3iYhQQ6KLTcLYSPdeJ6eF//Aq9yezYgAKQ1h0QUQxPcfQNCjOVtfIEzhO/0CT4gB0cQr5ldvx
        8y05QRqiiQ6kQklEAJPoGx50q
X-Received: by 2002:a63:f908:: with SMTP id h8mr8409109pgi.244.1570682243560;
        Wed, 09 Oct 2019 21:37:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHyOtObFJngENmZ9WtxzkJ1f8WRSs7XqzpzG4G5O/ox5y97nK3RVIhkAPkPbp3dMBqdu0v/w==
X-Received: by 2002:a63:f908:: with SMTP id h8mr8409069pgi.244.1570682243138;
        Wed, 09 Oct 2019 21:37:23 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id g12sm6544968pfb.97.2019.10.09.21.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 21:37:22 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Potential uninitialized field in "pll"
Date:   Wed,  9 Oct 2019 21:38:08 -0700
Message-Id: <20191010043809.27594-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Inside function set_chip_clock(), struct pll is supposed to be
initialized in sm750_calc_pll_value(), if condition
"diff < mini_diff" in sm750_calc_pll_value() cannot be fulfilled,
then some field of pll will not be initialized but used in
function sm750_format_pll_reg(), which is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/sm750fb/ddk750_chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 5a317cc98a4b..31b3cf9c2d8b 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -55,7 +55,7 @@ static unsigned int get_mxclk_freq(void)
  */
 static void set_chip_clock(unsigned int frequency)
 {
-	struct pll_value pll;
+	struct pll_value pll = {};
 	unsigned int actual_mx_clk;
 
 	/* Cheok_0509: For SM750LE, the chip clock is fixed. Nothing to set. */
-- 
2.17.1

