Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 653206A7409
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Mar 2023 20:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjCATHq (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 1 Mar 2023 14:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjCATHp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 1 Mar 2023 14:07:45 -0500
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BF64DBDA
        for <linux-fbdev@vger.kernel.org>; Wed,  1 Mar 2023 11:07:34 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-172a623ad9aso15480259fac.13
        for <linux-fbdev@vger.kernel.org>; Wed, 01 Mar 2023 11:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677697653;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B81xlViOcuY3fmYoSsyw/29AhQDJsJw7S4k495w2qRw=;
        b=LdZ2W4gvf4/lFGiC/gFHzI/D3oKtH/AhIHrxUHWpBkOfeJ+/OyHpsrni0kqgDmr0Qn
         IzzOWkH9A+crEGol3QH+pbewoKz1rBnEMqhEZxLB1ndK80Px4gkyokC7mfd26FQ4FwFQ
         USQDBqvdEC7ZZ/ySTz/tkjujo7fUOoyOr61RnLly6D3wHMR9SOdMuGXGHg011UuFalqW
         f6/KjUVAPL7V7F9APkE/17bS+czMrJq9XZE+0jKU+RvUXA/4RBAqTyMt4vF6OuXQ5lvt
         qsd+YPmpP+gKxumzvstUCmnGE0+3dFvVwbFL2czOOxeR32RSJgXGDWCMw52uUcdZK5YP
         D/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677697653;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B81xlViOcuY3fmYoSsyw/29AhQDJsJw7S4k495w2qRw=;
        b=4HUdcjK9JVdPYcJ0yLJfST5gsy76msGWP6mXWVGqJ7sqdgHeJNVlLGXz7N3noGbqI6
         YFn3sShP6Qmtjh7np/qT1wZ3ZfDSRR9v0apMIGfO0Ln8/FDubE41te4n0aflF3zAUrCb
         iqBqp2bvJKTAYNyMS2Q8ODKCCKyoqBzjU7t00ot5a7mk8KCTaGzOtaMT8EGWB23DeOPc
         93VZ/Htz+BnaEln2GickM0Eq2y8778ieJAlf1aJbaQKKv+O+Ogh4irQ0SYGI+/YuHD5i
         3yJyoT69bPVCznGf5XeWS/jswMpyVF110RpPvQ4YP0mSxi1OdIirfWFw3OgK/pBWqb7K
         TyAg==
X-Gm-Message-State: AO0yUKUXqBD2BrYW55dnXT9F9+D6NfzfOf6RdPupRZ+aiZsJCrg+NlMa
        3QWIqy6YDGlLM6l2aXY6vqYJwhDy4fuZgA0oGEs=
X-Google-Smtp-Source: AK7set/EJM+a59HZ9/ZcYfcgsPzzPlyujjOqczwg1J7UzxKyBKk5fILHjPEsUrJC27YGZbGK5UBme80GaKz1tD0xijo=
X-Received: by 2002:a05:6870:d1ce:b0:16d:cb48:e195 with SMTP id
 b14-20020a056870d1ce00b0016dcb48e195mr7775237oac.3.1677697653433; Wed, 01 Mar
 2023 11:07:33 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6840:5810:b0:122d:2058:f64d with HTTP; Wed, 1 Mar 2023
 11:07:33 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli001@gmail.com>
Date:   Wed, 1 Mar 2023 20:07:33 +0100
Message-ID: <CAD7994dyYoYqwwKGjpZ6OJPfZpfpNV+-VGWnZTZaEXzjRpdTdw@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:35 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4997]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli001[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli001[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham,
