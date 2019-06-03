Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E82E32E81
	for <lists+linux-fbdev@lfdr.de>; Mon,  3 Jun 2019 13:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbfFCLVK (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 3 Jun 2019 07:21:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33510 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfFCLVJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 3 Jun 2019 07:21:09 -0400
Received: by mail-pl1-f193.google.com with SMTP id g21so6887250plq.0
        for <linux-fbdev@vger.kernel.org>; Mon, 03 Jun 2019 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X1RK5o2YwgeeL35w0RyHVD/3IISKzcQZl/0CwWXVP98=;
        b=E9NczHkk6piU+jYvDH5MHbfCTe0nwwlQBO4NKK5OqqL8t8Di7UBvUy5RqhvzpmEXYM
         4uDpdSAyFkQAYmOl7DJNWyqhauAaVlINrxQCpIV3S+yKsGA0PqD1sxH3ysIQ1buEOGwm
         oYspBYwVphRJxVlce0VEuaZN9IjOldoI9Qm0c30PDUVtqRzE9kZ0WUHD++dEgtLLVuf2
         mrM96XS6XEmgsw1Ert1vhQMFigjEO/7ipzTNHtVuJRIgzx4izfJ5k4Y/35exZFXoICFu
         50yzoZD4MUaCvDtrV6KiTr6LY7sCXvkpjynV0Sli1NMyuXXpkn+/aBL6E49tcCfqxq4b
         aFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X1RK5o2YwgeeL35w0RyHVD/3IISKzcQZl/0CwWXVP98=;
        b=d22nWrc/iJzra+P7mMhBPn2W+NGMw/kQbpwvzBpIi0jrJ837itOGnJiEiMF0aq/hBf
         cEib3vRm6mp/nIiiPCIQ2RmESH8E6Kr0j770y3syZNqR79fJEDEGrNvO/L2TQeraNSQL
         XLQ7B8vapdei2fcnry3HiDsWFtxoUJZ/HIgaY99RSPNrOBm775bgu2lFEMspsCQNm4q9
         XbEhR+csLqk5NdBjSBCRyf591OSRzRwtOJ/NgFo4Is+NMNqv7CnMPZavfBDaBjoMPc6H
         +wtD3q5q0a0IDPaNzwF+tCeugLIw7WCfddqVYu7gWVKape08ojUx2B4ebehXTEhMS6H1
         xcsw==
X-Gm-Message-State: APjAAAVbn4Xm5aMNiJHRsvJfynleELorlKEwVZrUVPniSdYxKpLhDEAf
        r/6eYx7639OmN6HZMnGkd3c=
X-Google-Smtp-Source: APXvYqzSsvxko30YbiYYj7LlgHGa9uI7nrhtHqowooQWCAP1T1BXmYkLkNNKs/3fagu6iNcApFp0uA==
X-Received: by 2002:a17:902:2869:: with SMTP id e96mr28060532plb.203.1559560869155;
        Mon, 03 Jun 2019 04:21:09 -0700 (PDT)
Received: from localhost.localdomain (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
        by smtp.gmail.com with ESMTPSA id g9sm11792692pgs.78.2019.06.03.04.21.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 04:21:08 -0700 (PDT)
From:   shobhitkukreti@gmail.com
To:     malat@debian.org
Cc:     b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org,
        Shobhit Kukreti <shobhitkukreti@gmail.com>
Subject: [PATCH v2] video: fbdev: Fix Warning comparing pointer to 0 reported by coccicheck
Date:   Mon,  3 Jun 2019 04:19:12 -0700
Message-Id: <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
References: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Shobhit Kukreti <shobhitkukreti@gmail.com>

Fixed Warning Comparing Pointer to 0. Changed return value to -ENOMEM to
report kzalloc failure

drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0
drivers/video/fbdev/controlfb.c: WARNING comparing pointer to 0

Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
---
Changes in v2:
 - Modified commit message to report change in return type

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

