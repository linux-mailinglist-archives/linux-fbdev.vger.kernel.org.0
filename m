Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFE191E52
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Aug 2019 09:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfHSHwt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 19 Aug 2019 03:52:49 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37247 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHSHws (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 19 Aug 2019 03:52:48 -0400
Received: by mail-pl1-f193.google.com with SMTP id bj8so579420plb.4
        for <linux-fbdev@vger.kernel.org>; Mon, 19 Aug 2019 00:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlKDBJIsNufW28V6ZVF8IDeGI4PGxWNApwgG/b4eTws=;
        b=Dw0hWgkYFB3dytpBDmbQpXRk+XySvzd7IpKdq7HFPmg5QUkZU1jGDRrMOZQ/evrzrH
         RegyOEPSuMBG2ppJPMwm+u4yjS9VHVZp8hiIV57ru8ixl6hYV78Rgt92j4PptsAWREU2
         UaxO+eYdyqPPUPSFvsbjsmQxrFkZ+9EsS3kj84bxJB2PuigFj2DJgHOp9MNC06cfdcTv
         PKj40YHvsOV38eWJ4Cb1d5cDZoFXw+3saMu7lq4NrRpACn7k1f37SbPBTgmlly6uDLZ+
         tJwmlCnHD0ESpCNZZPkSnWNnNeVxHkd+ZRgLBuszRsuteg/ieTz1CPGIb3DCyErA3WR0
         47qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlKDBJIsNufW28V6ZVF8IDeGI4PGxWNApwgG/b4eTws=;
        b=HgMFPt84hfjN1ru+vFviXxUKLA9BL3vxMvyf0CiLc8mFVmcVVcMoZKMNoyDfN1XkQj
         oVd92Z/2oxoaHo/u+uw5weHA/UFgOJolE/xFQ6ZkAs+f6AYfo8xEd3TrnVT6V1aScLiC
         4sYMs4vBrENHHgmGs6dq6JDO/FdNJhbgnQUwJwQmfmcjwg1MDL9RPibyFJB83cpHsfNO
         h39w/9+vqsbun6HYgQAVZL258KPTyMku8Y/0X38csm0OIYcMXtZHms8wh5PGHM/TUz43
         EZhYP0uxSF4h7tdRXFWIx4CKEMYZCAmWIaoSXCB5WoQVzcICeCxqn9x0oBjpvfLBSNnm
         8clA==
X-Gm-Message-State: APjAAAVi90+fwvtI2au9jmW/w3Oeq2/ynBc/nJAa/nYSR55e81veCiy9
        ourbjtevFVs9Ky2wTST3Zlo=
X-Google-Smtp-Source: APXvYqzRW5XFT2uy4Xb+J+nKv6a9Q/XtN7z0ZW6m0hOqBXUupwmxruhVd6F2+vcKn96+xFzwf5LRPg==
X-Received: by 2002:a17:902:e407:: with SMTP id ci7mr7037887plb.326.1566201168076;
        Mon, 19 Aug 2019 00:52:48 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id g3sm20081613pfm.179.2019.08.19.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:52:47 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     bernie@plugable.com, b.zolnierkie@samsung.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] udlfb: Make dlfb_ops constant
Date:   Mon, 19 Aug 2019 13:22:36 +0530
Message-Id: <20190819075236.1051-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Static structure dlfb_ops, of type fb_ops, is not used except to be
copied into another variable. Hence make dlfb_ops constant to protect it
from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/video/fbdev/udlfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index c328e8265cb1..fe373b63ddd6 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1183,7 +1183,7 @@ static int dlfb_ops_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops dlfb_ops = {
+static const struct fb_ops dlfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_read = fb_sys_read,
 	.fb_write = dlfb_ops_write,
-- 
2.19.1

