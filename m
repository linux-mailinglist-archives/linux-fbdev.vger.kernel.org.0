Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4848D31FC9
	for <lists+linux-fbdev@lfdr.de>; Sat,  1 Jun 2019 17:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfFAPjX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 1 Jun 2019 11:39:23 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35847 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfFAPjX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 1 Jun 2019 11:39:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id u22so8031843pfm.3
        for <linux-fbdev@vger.kernel.org>; Sat, 01 Jun 2019 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=q9LeSxzzekMvPghgDp4XWodO/b6xbbc2XbiqEVR18MM=;
        b=WehB/YFAv0SIjEPRFL61+ubhkNJPCjGCWNpFp6Cem68k3F4SYpnC5IFC5HsWJ3cIkn
         oDhpzHT2A63Zo5Q7J2jElxLZwuY/jqISyEHpqaxPyulFL6Y1y+JCFgRbv9Xo+3AOGKCQ
         hzo6UsCPif2BfeVy8AODX9EUt0xzr6YkWU5Edr1Aqd15n0TK+q1YBYasRj/VumZXVQ/D
         ETvTLlQPklJNMin7gLqoHfjJlMIT8/dPj03ppSRxxPvpotHN7+wSP1c1HxWo6SRnPyW0
         luyyuojDTK+drUmQ7r1FXtXul+CM45Sk6ouPVubZmGVmhayYFNwvSu8qh7A3Q+7kUOCk
         /eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=q9LeSxzzekMvPghgDp4XWodO/b6xbbc2XbiqEVR18MM=;
        b=h9H2N5I9prrkI9Np5Jy9f2DkG0CgcAtcxYEsuJvVqmcHph5lCrtVFigUafquTbi2/l
         my6nzUjRTUAitaHczElsKzHaMNMqwjLw4lLznsibHSu8a7cfhyCpbhnr6z82Dc1I66Pc
         9O8bjXuhclrdnv1lfGgBftcTvVH9/TUZ9U1kXJFlTWmTJ89MIT05l7VnOTQZ167abAAv
         IyCwr8ZNewjnHRRCZNghdQ7jWk9xy4QNUj4v057SO16cs8Hqa0W64TYbsPJuxdeyHEw0
         4kanSQEZCEAtF4wGMgXrI4c3xcuUmlIMACf9eicNQ2Xc9qE7PjlyPs4yLImcDcYtEpfp
         mCIQ==
X-Gm-Message-State: APjAAAUxiYR8AZoSTZgp8fcQRpZ4mPX2sh4/q3BSY+BX0+jYUBoSBgSI
        8+5iIUqVMtHokWrQtFcx9V0=
X-Google-Smtp-Source: APXvYqzcLoQNDgfzgq3jL8ACpRfpZsiUpTd97As+odqEvw0AbuKxTbxlTJahyaestnmy9nXM6s/f9w==
X-Received: by 2002:a63:e54d:: with SMTP id z13mr16288850pgj.132.1559403562558;
        Sat, 01 Jun 2019 08:39:22 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
        by smtp.gmail.com with ESMTPSA id l63sm10562133pfl.181.2019.06.01.08.39.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 08:39:22 -0700 (PDT)
Date:   Sat, 1 Jun 2019 08:39:20 -0700
From:   Shobhit Kukreti <shobhitkukreti@gmail.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     shobhitkukreti@gmail.com
Subject: [PATCH] video: fbdev: Fix Warning comparing pointer to 0 reported by
 coccicheck
Message-ID: <20190601153917.GA20765@t-1000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0

Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
---
 drivers/video/fbdev/controlfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 7af8db2..07907c5 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -182,7 +182,7 @@ int init_module(void)
 	int ret = -ENXIO;
 
 	dp = of_find_node_by_name(NULL, "control");
-	if (dp != 0 && !control_of_init(dp))
+	if (dp != NULL && !control_of_init(dp))
 		ret = 0;
 	of_node_put(dp);
 
@@ -580,7 +580,7 @@ static int __init control_init(void)
 	control_setup(option);
 
 	dp = of_find_node_by_name(NULL, "control");
-	if (dp != 0 && !control_of_init(dp))
+	if (dp != NULL && !control_of_init(dp))
 		ret = 0;
 	of_node_put(dp);
 
@@ -683,8 +683,8 @@ static int __init control_of_init(struct device_node *dp)
 		return -ENXIO;
 	}
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (p == 0)
-		return -ENXIO;
+	if (p == NULL)
+		return -ENOMEM;
 	control_fb = p;	/* save it for cleanups */
 
 	/* Map in frame buffer and registers */
-- 
2.7.4

