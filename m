Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BB75B04B5
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Sep 2022 15:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiIGNGu (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Sep 2022 09:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiIGNGt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 7 Sep 2022 09:06:49 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB018760FC
        for <linux-fbdev@vger.kernel.org>; Wed,  7 Sep 2022 06:06:46 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id nc14so30209663ejc.4
        for <linux-fbdev@vger.kernel.org>; Wed, 07 Sep 2022 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=9JgfdaIQvQZ9l5SmCOLciVHAQhMDxaoqktdhOO0g2kU=;
        b=UW/dNjTQeGfMmz+fS40TBcSWJ/ZS3LrRxrDSL0LW0IgjUHOen8JBMLp+z4zD8PJPK3
         xp3q482c4DO33ccVfKBnHEkUbVU5MFwqBWZv9S0Tb3/HczIuAQ/Bl+lUQVWuRl/vc2Ff
         JIr7miug7ZnwYNVl11GhzK5onawrc6iL885a+R91c5LMZ2X5gWUIRFAsfk8nxrHFXSD5
         fW8Z3DaBdEyJVW6yJ/kQvD6PPDq1Rd/4f+43b2WJKnepK42QzQcBi9B/0flYP27p5Vuy
         44F8cBOBgxwT7G9zfFDUSjHelUNqVhUfo9B9qXIIlSEBGAIt664zI0lJdcqR3LUTg83p
         g/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9JgfdaIQvQZ9l5SmCOLciVHAQhMDxaoqktdhOO0g2kU=;
        b=D8UjluGY7PKdUjLfDDQKfT3tAvOXoX4FiakdUDAkGyd3uChncgwGASrdnGqhXKSBPo
         1QTH26gacEvK2w29OeCxbFflz6oWERsYMFWLBtBtFXzivNt4nzEuVKe0QcsKB9xQAe4m
         WKpkdS6bn/0V5T0yJ8iRa4hN178LLaUy/YFRdJNAW4B9dJeRbR+JW9jel92/fRRhxF6B
         ioQTPx5F4/qC31eDP0snho/RaxmRcdS5JNWeeJeIJbUfbdL2YPxLEl2+n+vGor+Q/mZ6
         50nGD+0/D+AjNH1CW5X3WBL7hEEv3lvkIbccPAe+dtlMIcUAIrz3zlXLJTsYcxvW/jX4
         mPxQ==
X-Gm-Message-State: ACgBeo2/Q/WTyqZqXCrYyYucO8dqt2A9P161e3wwUR3bb4B5ix7dfYSz
        jk7F6VkomKpG+hPEQA2drB8CnSc/xDd8Dr/eAPM=
X-Google-Smtp-Source: AA6agR72D99ll+utUyjFkUUi3LDVLxtykvWRka1icrEc0tRLvqVOL7NytmYGrsqSJR2SJUAzQhY8HwVNwsquY34R7rk=
X-Received: by 2002:a17:907:c09:b0:771:e7c:2f95 with SMTP id
 ga9-20020a1709070c0900b007710e7c2f95mr542380ejc.306.1662556004636; Wed, 07
 Sep 2022 06:06:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f742:b0:72f:a24b:f828 with HTTP; Wed, 7 Sep 2022
 06:06:43 -0700 (PDT)
Reply-To: stefanopessina14@gmail.com
From:   Stefano Pessina <awajimokpebenjamintheodore@gmail.com>
Date:   Wed, 7 Sep 2022 06:06:43 -0700
Message-ID: <CAB_LvSH6H72PTZAZhmidRWGxHcE9_4Cnon5VyexzgbyXcH5e6A@mail.gmail.com>
Subject: Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:633 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5942]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [awajimokpebenjamintheodore[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [stefanopessina14[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
I am Stefano Pessina, an Italian business tycoon, investor, and
philanthropist. the vice chairman, chief executive officer (CEO), and
the single largest shareholder of Walgreens Boots Alliance. I gave
away 25 percent of my personal wealth to charity. And I also pledged
to give away the rest of 25% this year 2022 to Individuals.. I have
decided to donate $2,200,000.00 to you. If you are interested in my
donation, do contact me for more details.......
