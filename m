Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A26E6E5FB2
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Apr 2023 13:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjDRLUw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Apr 2023 07:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjDRLUv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Apr 2023 07:20:51 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D26293D8
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Apr 2023 04:20:23 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso18307501fa.0
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Apr 2023 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816813; x=1684408813;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=XC305csHU2xcAigCDW/UJJRSy63sUoD1DwWAzNV4U0iYxy8goHeHHGwz2Dtl5/m3YJ
         T9bdrRZknZxMYPIiBULnraBuKxSl0HNfqQcboUhLDJduGFuKra4HRFLnqEKqRZWyTaP2
         W+aWO+mPOQGSXf/ntm95hfQmaO/IpuzJtFuzcZ2RNHeowBFKshVw1JHwpG6S1c930G5H
         RBNZNS227KDH2ty5Japa667+0gSX2GTyU3Z6Epa9IviM94SFF62N376jEO0xjhIqS7X7
         +zcHCsDf7ApePJubgC6hPqhbeb9JxqWvYbJr9jO+lZVonyMUpD0WvvCs3r5oqZi7yHC4
         oCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816813; x=1684408813;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=FTn/3V1MRVu+Kz59E6ghhR/W8hWVKz1AywOTfqJVbwpraOjI8C8gBIIzC1KGMc+5A7
         /nnnsFk9zqFI7HolllRQHOAT5kCbFRfqZQhyZHIbwCgI/R/qBXhvvRYMFLwujaJOqtw1
         b9aGj7ScMWt3y5VdUceQlXcHpcIvqq5nTxIcv4I5fBkQn2+qMltPtX1EAs0Cw/O/CTDH
         YiIbeFHcg3njy2tLxhud7Yzu0nMjXEVurH1LSJGJ6CL7nhgdSXYR0p+vNS5+cpDiEiPN
         vMEBbT1ZRhTDnjHAnQKzz7LWW32n1+JAYCK6lZa74jXw33cU9d0yhEl3eAaJAi3HyT1i
         lqDA==
X-Gm-Message-State: AAQBX9ch1lZEAtpkADmRBaJ886WhMkOLEonDkFgWbALN+ZSF04fTy7Ku
        QfBXcOhZEiOHt/UG2FkmFpubMhxwgzKw+ljzitw=
X-Google-Smtp-Source: AKy350bcWCWf9IZkHQ51NgpS4cckob2Em/wRdFDMztRCAWWmwNTaPicAxNL5eQymb/2tOaAh3M9uH1D3F86RwyN1ZDc=
X-Received: by 2002:ac2:4a76:0:b0:4e9:5f1c:fda4 with SMTP id
 q22-20020ac24a76000000b004e95f1cfda4mr2124558lfp.30.1681816813167; Tue, 18
 Apr 2023 04:20:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:5188:0:b0:224:d5a5:1453 with HTTP; Tue, 18 Apr 2023
 04:20:12 -0700 (PDT)
Reply-To: pmichae7707@gmail.com
From:   paul michael <edwinnicolas2222@gmail.com>
Date:   Tue, 18 Apr 2023 12:20:12 +0100
Message-ID: <CAOQHzrs_cYce9ZhEgRpgopafxCu7JRMVvWondpSyXRchkMTnig@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
