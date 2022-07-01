Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC9856389E
	for <lists+linux-fbdev@lfdr.de>; Fri,  1 Jul 2022 19:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiGARh1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 1 Jul 2022 13:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGARh1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 1 Jul 2022 13:37:27 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FE736B74
        for <linux-fbdev@vger.kernel.org>; Fri,  1 Jul 2022 10:37:26 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id cs6so4595857qvb.6
        for <linux-fbdev@vger.kernel.org>; Fri, 01 Jul 2022 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=c0efiEkVxtTkTFENAKnUNGf6D7Eoa+H/DnhrKy6xKHg=;
        b=ft+R/xzWQXjJ3Pa6dRmbJc0B4oP3EM0u4Xkf8Gvl/ueqCAYjAX3sWdSYS+JK1qR3Gs
         iTB+62uQx3moVL0iKMB5khKS/ba0N6fUUBwfb/DsU1QOFp6cZBI9QuQMq+/Je0eKW8XU
         8RGbbuW/aY0OtpTCPypWqM0RxXTk5q7Q3gNSmI63Rk/hBlJdkYX+4e1EBZkfczJq3/Sq
         GrzPedKDm8MNS7PWRcuGVcwyMZEFsh9INnt8U2/leqcSRQCQaq8a5kryx4W9nF2HWcXW
         pnqPraR7QiYJSejKs9S2TvCNriDvIZ7usfoQn84lUzqLNZWZXLq+zdkMo0oyo6vixlqF
         14CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=c0efiEkVxtTkTFENAKnUNGf6D7Eoa+H/DnhrKy6xKHg=;
        b=BFtQTHZNocRt1jiVbZQivQ9SVsk1/r9xUrfzUE7Mj5KV9PLXHV6Xq6voeZHA+SsPYj
         yxdYEXAZvP6HK8sZNkEdtzK5txZN5WjSBQfgMo+1bArCWwVlTuAShDXL60EW+FITFVRN
         LLrOfVyOCKUIxUM9lcYThjOWfPlIxYGNQYb1L9GIv1HVd3bYaNwrLhiZz0rHXNFZx415
         3cv6582YZo7MtKWu54rhpx9fY27LcEYPXbXowSjLKp2c7V5APx5Q7N1TiKDX/tum4lnW
         WuG2DA7pNTffh+n7Z8ndqtjPkDtTjH3rrZcy+Q5vn4KMk6uzBRNZqZJRCVoDafSUVwcU
         a+Xg==
X-Gm-Message-State: AJIora909KrdOmYWmFz0Wysgq53DZsoldLjaZwn/jtXJlZ8gWbOllbhh
        VO3GYoAYu13aTBz69FwlaVaoNLjDUkQKXH7uVsoc72RbfAYzQQ==
X-Google-Smtp-Source: AGRyM1til2P+7aPik/0Qo5e9U0MoJpIjwDA8uQF0R6THY3SeYd9NQ5mLyeZZ/7pCVVuoBWLBeAicFfJj23si5iv79o4=
X-Received: by 2002:a05:6214:caf:b0:470:a512:8473 with SMTP id
 s15-20020a0562140caf00b00470a5128473mr17228582qvs.75.1656697045665; Fri, 01
 Jul 2022 10:37:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:7044:0:0:0:0:0 with HTTP; Fri, 1 Jul 2022 10:37:25 -0700 (PDT)
Reply-To: anwarialima4@gmail.com
From:   Alima Anwari <soniagarang014@gmail.com>
Date:   Fri, 1 Jul 2022 17:37:25 +0000
Message-ID: <CANJ88boLT3TjLHHTV+9M51RXy3JEtWD5r5TKtyNYkJC1HaBXWg@mail.gmail.com>
Subject: Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
Hello dear friend, i'm Alima Anwari from Afghanistan, please reply
back to me and have an urgent issue to share with you. I will be waiting
for your response.
Thanks.
Alima.
