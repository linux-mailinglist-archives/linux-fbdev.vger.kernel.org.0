Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E05586ECC
	for <lists+linux-fbdev@lfdr.de>; Mon,  1 Aug 2022 18:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbiHAQl0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 1 Aug 2022 12:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbiHAQlZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 1 Aug 2022 12:41:25 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737EEF3A
        for <linux-fbdev@vger.kernel.org>; Mon,  1 Aug 2022 09:41:18 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u1so7945926lfq.4
        for <linux-fbdev@vger.kernel.org>; Mon, 01 Aug 2022 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=Bxl5axUsg9q1jblhPn/sD0+XJcBD3bAcmC9Aes5ip1ahcImMEHBlh+Er+rhf8FIO5i
         +XJNmIRVpjVrbiySb5O5JjfIYrlkw/mOOo1qLRe9SX6sdqO1Rz2KXY4WbugpN4fJWRij
         CC78UfV1dMZkmuojiTGc3RQBuAg37lvfWIZxpBN7oIZ+TFFhJCkZYKmkXCGO1XSk++os
         BEc9uqs1UR2e1JE6FJCIOTKylSGKLi8i6iImu/1NRs2zwpfONk1G3Sx/5wm/96rkxk/n
         idBjkyW5OxynxwIdfLGjdySuoKDi/2Cx+yQ5t/sygpVds2zaObagHbRvikV7OatiZuWO
         7vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=pD1V4HnsihAChZuOeXifM3LK619MFiSBwVuEK/gn+IHdjTXfCA021rBmuMlHXHBMLQ
         FOMHnlHHXcI/GbuzwMhANu+OZ6lXrEnxTxPfYSVy9HreZs/S6caXUH7FrWAgjLLDCM7z
         bQZ2rJA3l8YFYtKbxIjDD2HmkQ1lpNG54bDijvmQ/+6VMnkF8VK2bI/keLtJkKj0LkEh
         aW80ELbVXeOrsn3yYmu4FHquiYbMa9Nz4hYmAFdR9CA5IN3krC8LvB7m5iXyaAVJ6x8B
         tNIFm/faxfXyxCcwOQRUKXL9nk2zelNFbeiGhQmOd6ZlDZQ3bBxX2UrHzQDNNHAOENDx
         YwoA==
X-Gm-Message-State: ACgBeo2B85IRFWHYV/4MZ4Vq/90mpRYXd2Gnk4d2pbSdoU83m2RQT9Gr
        Nyt9UpuVa7Rs5BERe66fwQBNSlVxBDqbuNOx3hU=
X-Google-Smtp-Source: AA6agR7hKhHIm3F/ejmSJp6d9SbrPg4lDvobGmT+31j9yOEF5/lXFTH1cRKmZ7l8KWQdcnShwsngG5SjR8Fu/Me3Bwc=
X-Received: by 2002:a05:6512:2c8a:b0:48a:f7e9:973f with SMTP id
 dw10-20020a0565122c8a00b0048af7e9973fmr2082578lfb.5.1659372076778; Mon, 01
 Aug 2022 09:41:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:cb52:0:b0:1fa:aaed:e6d9 with HTTP; Mon, 1 Aug 2022
 09:41:16 -0700 (PDT)
From:   Bright Gawayn <gben68387@gmail.com>
Date:   Mon, 1 Aug 2022 22:11:16 +0530
Message-ID: <CAG1+V0wE_akdUeEq+pYde2NDn1FBw6gG03M1=wDyPkOui2q5Hw@mail.gmail.com>
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
        *      [2a00:1450:4864:20:0:0:0:142 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5011]
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
