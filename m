Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B6D586EE2
	for <lists+linux-fbdev@lfdr.de>; Mon,  1 Aug 2022 18:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbiHAQnc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 1 Aug 2022 12:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbiHAQn3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 1 Aug 2022 12:43:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE5C1CB0A
        for <linux-fbdev@vger.kernel.org>; Mon,  1 Aug 2022 09:43:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r14so12967431ljp.2
        for <linux-fbdev@vger.kernel.org>; Mon, 01 Aug 2022 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=bf7kmBr/SgfZ1wV4nI5vTAndNdYUbiAGmhGqIym6rX1OX0IxSa121QCCLjtfPTtP/q
         Ji+y0OXbVSONjuLK/7HvTPJ0m6T7C2i8zva8hRhi9PAc4NLMf2QcGCMsVKAR/4SoxG8P
         QCVBFNb+TBSE6hOTyUwwlUWtblNmcAsvavL/vwkHJhwxC5HKcnSuNdd2JaoddtOnq0f2
         l8L1cTnZHt01Ad2nR5db4ZRgjujP4vZ5Nbd+R/n0bCKSy+6DchnTG1m2WXhoILL//vjC
         4hQ2rR4QddBHqcFb8uNfmIzBTiaeke8T1siffGxdfn9eTO7JBIN070YbQDUKkrumHKo5
         1fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=tyPMEq6mlEQT3AyOqTL79e1EfkkyllUGY4k+Rl7fyZHLu6o5fHa4W+a10mGfoXDqey
         1y8EcUl3qW01DvatVtveQu1XhJ4lTaH2fPkQUG86lHXW5e6Wx4ArrBqrpDjWzFYMDLe5
         AFPOvpaACVRywfXgEbvyoZj7Ldxr8XEZo1o61Szr7CUnyO/0G40ePNxaobK/vzX6hwfU
         fSCnWMBXuEBqQu78OCzEIRNKkUf9FbkTqnL+/MItDJmCBk0B3iYrgH+YfyO9wM4ZTD5C
         j+NkWIi7UL5yGGcHA+SQZtWHXSM9ZwLBDMI7wbwo26bVdFARmDPPGYHwqd+IaTd+ofFO
         cxog==
X-Gm-Message-State: ACgBeo0MJeMKBAVT6Agv90KeUB90J+J3hdj3LQxQg1ItX5u1CP43P93W
        N1YIQ7qunOt0Q8oLhz0tXkVa7e0S45sA9/ZivqM=
X-Google-Smtp-Source: AA6agR515/n1OMi0vRWF0LCNYzDsADnnMxK25Yt6CRjhyA+ZrhMbjmB0DBADjlTnR+ktgvNpDDCS04nHCVe1WUuUnWY=
X-Received: by 2002:a2e:3806:0:b0:25e:48ff:a218 with SMTP id
 f6-20020a2e3806000000b0025e48ffa218mr3294471lja.292.1659372205210; Mon, 01
 Aug 2022 09:43:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:cb52:0:b0:1fa:aaed:e6d9 with HTTP; Mon, 1 Aug 2022
 09:43:24 -0700 (PDT)
From:   Bright Gawayn <gben68387@gmail.com>
Date:   Mon, 1 Aug 2022 22:13:24 +0530
Message-ID: <CAG1+V0xy74Pa_JLx+ze1qhQfmiuJXdNJ4_AvNnskoiwRCHFd=g@mail.gmail.com>
Subject: Lucrative business proposal very urgent!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:243 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5113]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gben68387[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gben68387[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.5 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello dear My name is Mr Bright Gawayn,  It's my pleasure to contact you today.

We use a certain raw material in our pharmaceutical firm for the
manufacture of animal vaccines and many more.

My intention is to give you the new contact information of the local
manufacturer of this raw material in India and every details regarding
how to supply the material to my company if you're interested, my
company pays in advance for this material.

Due to some reasons, which I will explain in my next email, I cannot
procure this material and supply it to my company myself due to the
fact that I am a staff in the company.

Please get back to me as soon as possible for full detail if you are interested.

Thanks and regards
Bright.
