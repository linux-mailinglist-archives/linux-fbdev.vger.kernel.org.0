Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341B852FF1D
	for <lists+linux-fbdev@lfdr.de>; Sat, 21 May 2022 21:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiEUT75 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 21 May 2022 15:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiEUT74 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 21 May 2022 15:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CAD525A599
        for <linux-fbdev@vger.kernel.org>; Sat, 21 May 2022 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653163192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=eomylUjoy+pLbbY53zh3vxeaeYYwVLT+/xfRVktypDI=;
        b=WyU6Wc9RK5VkufC65ZGPZnaTvaXnpkU/ReJKJrr7doSHWNEUIOWC6fPAqpPwPdy/M1ogoD
        R98BB+Fv8+a7pLAvcWcIV84ITvCr0tCOHNloqJFln1zwkkSjAlAz8+kO6wwCr7IZ5DxmFu
        zdU99RALuf637ntaCYlPYGL9SzP4zrA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-3C0F3ikjMnql6uu-XKXzQw-1; Sat, 21 May 2022 15:59:51 -0400
X-MC-Unique: 3C0F3ikjMnql6uu-XKXzQw-1
Received: by mail-qv1-f72.google.com with SMTP id fw9-20020a056214238900b0043522aa5b81so8719668qvb.21
        for <linux-fbdev@vger.kernel.org>; Sat, 21 May 2022 12:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eomylUjoy+pLbbY53zh3vxeaeYYwVLT+/xfRVktypDI=;
        b=nZgWT76RcsWCAU1SzgmPdATRQAO+Qay8Qbv9SeNHLXjbE1Smm9ZW9ErnFEF+FVRDjK
         9VpmjVpt/vZGF+Ef06imM4Z5ZZfMJwVnHkwhwzGtfa85N+vuELlrKkjGcnwjgCR7YLu7
         M9f6PNN0UsmiKow4tQkBH7Ppsqj2C289iXxYElb960kKnfE3LfrsyxZsFpLRZOzGma9Y
         ISzP4dRNwIQsh8pQLhJnd79a/PvAcuezSWYwPP4YXMvGwibdzQ/yUQqmm5D360AVHgG5
         RflwHvy/nuTw/3e2u+AaYdFJmNtugEFVr8ypQzfin0UaPNgnqeeOxzVVV+4LY8NoxW9M
         Gdyw==
X-Gm-Message-State: AOAM531F+eNHzKPoxxmL8W0b/6gpwPEeMLlZiZeRE8q+36q2iF1Tz+E/
        saqA/wjdyG1CKuRfmb25RpSuwxHNC2dsvdbWYLBhsIN+723DmElKdRdLhAAETz7h1rvm4miBcVw
        p1bz1DEdGZClrxzm47NlvhWQ=
X-Received: by 2002:ad4:5dc1:0:b0:462:194:bc7a with SMTP id m1-20020ad45dc1000000b004620194bc7amr9892594qvh.87.1653163190911;
        Sat, 21 May 2022 12:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf919nsR9kr6U7ozrIg7YcLk/jrdGbT7NVDQ6iTc+jPVEWfWOWvuH+VNlWAYwqIEm9/j7Cdg==
X-Received: by 2002:ad4:5dc1:0:b0:462:194:bc7a with SMTP id m1-20020ad45dc1000000b004620194bc7amr9892587qvh.87.1653163190629;
        Sat, 21 May 2022 12:59:50 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id e11-20020ac8490b000000b002f914fa980bsm1747226qtq.79.2022.05.21.12.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:59:50 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     deller@gmx.de, tzimmermann@suse.de, javierm@redhat.com,
        boris.ostrovsky@oracle.com, jgross@suse.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] xen: remove setting of 'transp' parameter
Date:   Sat, 21 May 2022 15:59:42 -0400
Message-Id: <20220521195942.645048-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

cppcheck reports
[drivers/video/fbdev/xen-fbfront.c:226]: (style) Assignment of function parameter has no effect outside the function.

The value parameter 'transp' is not used, so setting it can be removed.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/xen-fbfront.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 3bed357a9870..4d2694d904aa 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -223,7 +223,6 @@ static int xenfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	red = CNVT_TOHW(red, info->var.red.length);
 	green = CNVT_TOHW(green, info->var.green.length);
 	blue = CNVT_TOHW(blue, info->var.blue.length);
-	transp = CNVT_TOHW(transp, info->var.transp.length);
 #undef CNVT_TOHW
 
 	v = (red << info->var.red.offset) |
-- 
2.27.0

