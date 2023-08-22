Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390B9784E55
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Aug 2023 03:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjHWBle (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 22 Aug 2023 21:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjHWBld (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 22 Aug 2023 21:41:33 -0400
X-Greylist: delayed 919 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:41:31 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8105AE46
        for <linux-fbdev@vger.kernel.org>; Tue, 22 Aug 2023 18:41:31 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-56-64e54b4b91a5
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id D9.6B.10987.B4B45E46; Wed, 23 Aug 2023 04:56:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=BUUo/eblhpGo9jIDNvw1fRygYNSxZoTbfHKPOEQmnpdTZfsox1zWw0P++1oorvFD6
          0XhAVcnbMUKH7xNyqA8NJ7Sb2latrxeEge9djAT/URAOjslbtRzEP0qUBLrDTW9pM
          Bfi7d64g9KUt7PgQOYbS1DFkpzpaCExtpwcOyh9ok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=KHUgKSDPJzYzEvPJQwEM1Smoj0MBMbuRGN5o8ZWjEkYSdol+z6/6AfX6TWNXIlqjv
          pMZTKrFf2O0zy3BVijL+LPvRYJOHxwDi8IXAE8CUqg7zeydti6rNYBsaSjPlAAxMt
          shUFQgbfUd8sfygxy94L5c8XQAl75a2KX7N28P+u8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:00 +0500
Message-ID: <D9.6B.10987.B4B45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-fbdev@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:14 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW9fb+2mKwYFdShYn+j6wOjB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhI3N/WydjFyMUhJLCH
        SeL/o3NgCRaB1cwSn9fmgyRYBB4yS8y49J8VoqqZUWL29tWMIFW8AtYSvzbMYgaxmQX0JG5M
        ncIGEReUODnzCQtEXFti2cLXQDUcQLaaxNeuEpCwsICYxKdpy9hBbBEBeYk9/e1gi9kE9CVW
        fG1mhDhCVWLdhptgtpCAlMTGK+vZJjDyz0KybRaSbbOQbJuFsG0BI8sqRoniytxEYKglm+gl
        5+cWJ5YU6+WllugVZG9iBIbh6RpNuR2MSy8lHmIU4GBU4uH9ue5JihBrYhlQ1yFGCQ5mJRFe
        6e8PU4R4UxIrq1KL8uOLSnNSiw8xSnOwKInz2go9SxYSSE8sSc1OTS1ILYLJMnFwSjUw9h9n
        Pzaz3+OKo5jp5f+MPYnK+QoS3t9XCv2ep5dwYmn2qv+/znLbhP4t3czDfC9r5uHN4c4b/bnS
        2Z6Z/30T1q6UHWSi4ltSWqi16u0Bnk8dnolnfyserVE+H/KlnFt6zlPBglbl9Xo8v6/3zRBc
        opfg1DkloK2j/j3zo+3xPCk/T4lczl2lxFKckWioxVxUnAgAEE1pKz8CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

