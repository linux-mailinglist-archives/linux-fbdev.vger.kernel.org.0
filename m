Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAF41E32E6
	for <lists+linux-fbdev@lfdr.de>; Wed, 27 May 2020 00:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404358AbgEZWrz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 May 2020 18:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391442AbgEZWrz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 May 2020 18:47:55 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B824C061A0F
        for <linux-fbdev@vger.kernel.org>; Tue, 26 May 2020 15:47:55 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id v15so10320508qvr.8
        for <linux-fbdev@vger.kernel.org>; Tue, 26 May 2020 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=teAmu69bgSntRJN8fh+rAnF1/9Xzb/8LyTa0nS/Bw/w=;
        b=hlntefcJiVY7WAW+DqLZb5zZoyEETNFGmL10kd1iF3eBhDCealr+Pw2Tb+twOLff5x
         Xby5fUwlWhMOKduTj9AEVl5n+dj7v6Eoao7FE8YPoBbNibKyYFy0J9tFhPpQNHLmWJkG
         4fU/lNZpdytMhJ2/eH+6aaGFpAUFghLDSe4No8LGxQU8Tjl8ry2QbiRzJgulrbF48XON
         1uC07aQj0EVcz8ifDD6mBsJL0MgAedWWZxYE7HB+P0kKt1i/kRMh86xQV4SfL1O8XAu7
         ESsVRZFYrqdT/5wdYlKfU8/q5ge8iqRip7xsAA0M/Hz7UfWHrmiEtR0R1QSZIRwqTm2+
         OEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=teAmu69bgSntRJN8fh+rAnF1/9Xzb/8LyTa0nS/Bw/w=;
        b=WHSJMEtvey6tgK/0Vgsbhmg9ik8YSGrlSn+qlUdGsF98AREdUTCIx+8KBF3dg51Fs4
         ftyG7lmrsYkouqz4Q/XRAgkSvsKlGOfMzYF7qzu72axPuToDX+1BYMXRmMd6VErZveaa
         w7rf3MUpXKmdiamRSldqehizZt7URKxDyqPMaWS4vG/fI5DpKymRssebKj4V0paVV1nG
         Xu99+Mo34IDdyDojzo+jfEAmNxkMFBFkAKpuHw4QJzMq15vGAFUc6sgK5iU7DMWEeCAh
         103UNFW8p601CI/TsGfUSiPuwaSAQpuj1Hzd1Pn1SErX4764k4Z3/Fm6IlsFxFkry9ib
         iiIA==
X-Gm-Message-State: AOAM533X3PFeo5fkX8g1fYtyieeJdpKfkUJoFrTGUemPWyiXDbb7e9rF
        xPo8+ajSBHxdNROako7qDP2U+hAxWS4=
X-Google-Smtp-Source: ABdhPJwkuvT20Bx/H2rbaGUqCSlr8S836/29rNPoK6RDMqREzBybgHsufMjzjf4T6Z74DDnMeC6hrQ==
X-Received: by 2002:a0c:99c7:: with SMTP id y7mr22278742qve.188.1590533274057;
        Tue, 26 May 2020 15:47:54 -0700 (PDT)
Received: from igor-Aspire-F5-573G ([189.84.32.31])
        by smtp.gmail.com with ESMTPSA id a27sm919477qtc.92.2020.05.26.15.47.53
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 26 May 2020 15:47:53 -0700 (PDT)
Date:   Tue, 26 May 2020 19:47:50 -0300
From:   Igor Ribeiro Barbosa Duarte <igor.ribeiro.duarte@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     igor.ribeiro.duarte@gmail.com, linux-fbdev@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Add names to proc_setBLANK args
Message-ID: <20200526224750.GA29722@igor-Aspire-F5-573G>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add names to proc_setBLANK args.
Found using checkpatch.pl.

Signed-off-by: Igor Ribeiro Barbosa Duarte <igor.ribeiro.duarte@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 55fe5a2..19823c7 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -166,7 +166,7 @@ struct lynxfb_output {
 	 */
 	void *priv;
 
-	int (*proc_setBLANK)(struct lynxfb_output*, int);
+	int (*proc_setBLANK)(struct lynxfb_output *output, int blank);
 };
 
 struct lynxfb_par {
-- 
2.7.4

