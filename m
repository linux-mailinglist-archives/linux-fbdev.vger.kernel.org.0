Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E237E55051D
	for <lists+linux-fbdev@lfdr.de>; Sat, 18 Jun 2022 15:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiFRNge (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 18 Jun 2022 09:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiFRNgb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 18 Jun 2022 09:36:31 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9E417ABC
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Jun 2022 06:36:30 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a2so10775706lfg.5
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Jun 2022 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8d0a50vlXPwK/evqvKND5Qkww0VWt34LxBu4KEjcCqk=;
        b=fVK50sbywWw0s/hnbxuEu8JP1OsJuDAEJyRMmTDqiFXYq40PL6g4Ki7ni9QQbtexwJ
         FxPfkIAmN3XOj/Hfl9ixhEFzbeo+RtoUC1k+pfX9semnOSVbHBCOOva0hQiBU80kDHi4
         C4TXcLrcKj4hryadvpzLLYCD1mILm+c2HTCYgfacf/bSalw/aH+mO9kmm/vekWj2A0+S
         jc335BM1AIdSJGZspLr0tDmtAAuYsNZPKifeGOiVHZu5FXi6Sr7kbXi/UuGCaGnApJG4
         HkO2VSkFNBHjSLxW4MJ3cLztwFnS6NIJk4E+Mv7X7NrXOXiWN73yIISYyg/yJvqV84SV
         jinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=8d0a50vlXPwK/evqvKND5Qkww0VWt34LxBu4KEjcCqk=;
        b=S4eTOICa/rfVKee/tMIQxImFQvE3c7LL3RAsd/ymGyr43svJc7s3cm718AWLI8SIku
         3+k6F4OAaGUv0x1WEXKz7vvW4drRM9PbcZOKmcxskPKts98PFcLCla7OBoOG2aAqVslu
         mjHTmRjMyLKgyuidA9ak33ghqB90OSqV/MapDWtsYweQATdFiURk5IvT9A/SdHSYiEYJ
         Lm12RFjMMOfCgmohU84bSlEI8X6NQ/tHBFKBgUdxQzpEOHy5e+XuQj7rPpQ7cE2X8+WI
         SRDu3AFJEtQo65u675ZRckfyV+3UKfyL1Bnue5fZukOY+/k7eWOrs+sLBbpSRH6ATFin
         xVKA==
X-Gm-Message-State: AJIora/GLeV0dYgJdif9vkhyukVyDKP7V2TD3OiNiwQzyWk+MKWU/nBP
        2kh/pOnZPyFZeP/MwDLCafBtIZdY7Vdp/Cy+7l8=
X-Google-Smtp-Source: AGRyM1sgjD+2fOAhl0q2xtkwxr+XI9F6g+nG5WYZbAcugcpq9UF1mIDcYqXOrHTXPJVO1yUDrtdiXPTnIvNV/moafC0=
X-Received: by 2002:ac2:4f03:0:b0:47e:53ff:7da with SMTP id
 k3-20020ac24f03000000b0047e53ff07damr8882776lfr.449.1655559389012; Sat, 18
 Jun 2022 06:36:29 -0700 (PDT)
MIME-Version: 1.0
Reply-To: evelynjecob47@gmail.com
Sender: mr.selatnia.moura@gmail.com
Received: by 2002:a05:6512:318f:0:0:0:0 with HTTP; Sat, 18 Jun 2022 06:36:28
 -0700 (PDT)
From:   Evelyn Jacob <evelynjecob47@gmail.com>
Date:   Sat, 18 Jun 2022 06:36:28 -0700
X-Google-Sender-Auth: JEmbr9wXAzUZ2VeJEgfwNPz965c
Message-ID: <CAMm+SZUxuTZ1jd8mmRwdsmdjOsJZJJYcYn-Q=O8OVUNq80tZKQ@mail.gmail.com>
Subject: Ms.Evelyn
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FORM_SHORT,MONEY_FRAUD_3,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5567]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [evelynjecob47[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mr.selatnia.moura[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
        *  0.0 MONEY_FORM_SHORT Lots of money if you fill out a short form
        *  0.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 MONEY_FRAUD_3 Lots of money and several fraud phrases
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Greetings dearest

I'm a 75 year old woman. I was born an orphan and GOD blessed me
abundantly with riches but no children nor husband which makes me an
unhappy woman. Now I am affected with cancer of the lung and breast
with a partial stroke which has affected my speech. I can no longer
talk well. and half of my body is paralyzed, I sent this email to you
with the help of my private female nurse.

My condition is really deteriorating day by day and it is really
giving me lots to think about.  This has prompted my decision to
donate all I have for charity; I have made numerous donations all over
the world. After going through your profile, I decided to make my last
donation of Ten Million Five Hundred Thousand United Kingdom Pounds
(UK=C2=A310.500, 000, 00) to you as my investment manager. I want you to
build an Orphanage Home With my name (  Ms.Evelyn Jacob) in your
country.

If you are willing and able to do this task for the sake of humanity
then send me below information for more details to receive the funds.

1. Name...................................................

2. Phone number...............................

3. Address.............................................

4. Country of Origin and residence

 Ms.Evelyn Jecob  ,
